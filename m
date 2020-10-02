Return-Path: <SRS0=OYMf=DJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC29C4363D
	for <linux-usb@archiver.kernel.org>; Fri,  2 Oct 2020 18:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 989A0208A9
	for <linux-usb@archiver.kernel.org>; Fri,  2 Oct 2020 18:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbgJBSuJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:50:09 -0400
Received: from freecalypso.org ([195.154.163.71]:40240 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBSuJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 14:50:09 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id 65BAB3740218; Fri,  2 Oct 2020 18:49:37 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH v3 1/3] USB: serial: ftdi_sio: use cur_altsetting for
 consistency
Message-Id: <20201002184937.65BAB3740218@freecalypso.org>
Date:   Fri,  2 Oct 2020 18:49:37 +0000 (UTC)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ftdi_determine_type() function had this construct in it to get the
number of the interface it is operating on:

  inter = serial->interface->altsetting->desc.bInterfaceNumber;

Elsewhere in this driver cur_altsetting is used instead for this
purpose.  Change ftdi_determine_type() to use cur_altsetting
for consistency.

Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
---

Simply changing altsetting to cur_altsetting would have caused the
offending line to exceed the 80 character limit.  Instead I changed
the code structure to be the same as in Johan's recent JTAG quirk
cleanup patch.

---
 drivers/usb/serial/ftdi_sio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 12a4b74ca1f4..a34c0d8b0cd3 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1571,7 +1571,8 @@ static void ftdi_determine_type(struct usb_serial_port *port)
 	dev_dbg(&port->dev, "%s: bcdDevice = 0x%x, bNumInterfaces = %u\n", __func__,
 		version, interfaces);
 	if (interfaces > 1) {
-		int inter;
+		struct usb_interface *intf = serial->interface;
+		int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
 
 		/* Multiple interfaces.*/
 		if (version == 0x0800) {
@@ -1586,14 +1587,13 @@ static void ftdi_determine_type(struct usb_serial_port *port)
 			priv->chip_type = FT2232C;
 
 		/* Determine interface code. */
-		inter = serial->interface->altsetting->desc.bInterfaceNumber;
-		if (inter == 0) {
+		if (ifnum == 0) {
 			priv->interface = INTERFACE_A;
-		} else  if (inter == 1) {
+		} else  if (ifnum == 1) {
 			priv->interface = INTERFACE_B;
-		} else  if (inter == 2) {
+		} else  if (ifnum == 2) {
 			priv->interface = INTERFACE_C;
-		} else  if (inter == 3) {
+		} else  if (ifnum == 3) {
 			priv->interface = INTERFACE_D;
 		}
 		/* BM-type devices have a bug where bcdDevice gets set
-- 
2.9.0

