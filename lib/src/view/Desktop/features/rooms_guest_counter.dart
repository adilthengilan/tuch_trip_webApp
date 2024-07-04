import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';

//==================================== How Many Guests are Booking and they need How many Roooms ====================================================
//===================================================================================================================================================
//================================================= Rooms Guest and childrens count =================================================================
//===================================================================================================================================================
//===================================================================================================================================================

class RoomsCountDropDownSheet extends StatelessWidget {
  final double height;
  final double width;
  const RoomsCountDropDownSheet({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheet = Provider.of<FeaturesProvider>(context);
    return Container(
      height: height * 0.5,
      width: width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.00),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(5),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //================================================ Rooms
              Consumer<FeaturesProvider>(
                builder: (context, bottomsheet, child) =>
                    _buildDropdown('Rooms', bottomsheet.rooms, (value) {
                  bottomsheet.setRoomCount(value);
                }),
              ),
              //=================================================== ADULTS
              Consumer<FeaturesProvider>(
                builder: (context, bottomSheet, child) =>
                    _buildDropdown('Adults', bottomSheet.adults, (value) {
                  bottomSheet.setAdultsCount(value);
                }),
              ),
              ////////=============================================== CHILDRENS
              Consumer<FeaturesProvider>(
                builder: (context, bottomSheet, child) =>
                    _buildDropdown('Children', bottomSheet.children, (value) {
                  bottomSheet.setChildrenCount(value);
                }),
              ),
              sizedbox(height * 0.02, 0.0),
              ///////////////////////////////// CHILDREN AGES
              if (bottomSheet.children > 0) ..._buildChildrenAges(context),
              sizedbox(height * 0.02, 0.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, int value, ValueChanged onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: DropdownButton<int>(
                value: value,
                onChanged: onChanged,
                items: List.generate(60, (index) => index)
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString().padLeft(2, '0')),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildrenAges(context) {
    final bottomSheet = Provider.of<FeaturesProvider>(context, listen: false);
    List<Widget> childrenAgesWidgets = [];
    for (int i = 0; i < bottomSheet.children; i++) {
      childrenAgesWidgets.add(
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Child ${i + 1} Age',
                style: TextStyle(fontSize: 18.0),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Consumer<FeaturesProvider>(
                  builder: (context, guest, child) => DropdownButton<int>(
                      value: guest.childrenAges[i],
                      onChanged: (int? newValue) {
                        guest.setChildrenAges(newValue, i);
                      },
                      items: List.generate(18, (index) => index)
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString().padLeft(2, '0')),
                        );
                      }).toList()),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return childrenAgesWidgets;
  }
}