import 'package:flutter/material.dart';
import 'package:new_bloc_practice/feature/home/models/product_model_details.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 200,
              width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.productDataModel.imageUrl))
            ),
          ),
          SizedBox(height: 15,),
          Text(widget.productDataModel.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 8,),
          Text(
            widget.productDataModel.description,
            style: TextStyle(
              color: Colors.grey[600]
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               "\$. ${widget.productDataModel.price}",
               style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
                 color: Colors.black
               ),
              )
            ],
          )


        ],
      ),
    );
  }
}
