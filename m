Return-Path: <SRS0=ACcI=AS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AA9C433E2
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 04:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AA0820738
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jul 2020 04:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QK8XmgXl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgGGEwy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jul 2020 00:52:54 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:55613 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgGGEwu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 00:52:50 -0400
Date:   Tue, 07 Jul 2020 04:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1594097568;
        bh=AOCJo4KszPc6cDSEFbOggU0+XbOioihHgRo2YDXQqE4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QK8XmgXl4qX7h4MqtEOJ1gd8O32hdN+3cYyF6nbH17pP6zRWr+z+NnynbwWfEVUMR
         1pbn1ugkWh9CJNDUIPh0Y3pxOY+e6vDDSUk7bWH0AP7X5G+k2CQZa6t/q36wvuYQTo
         F8nNWIbHcnD7MapFIcrMyK6MzKPtTJOtkIPyp+H4=
To:     gregkh@linuxfoundation.og
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH 2/2] usb: correct kernel-doc inconsistency
Message-ID: <20200707045207.235540-2-colton.w.lewis@protonmail.com>
In-Reply-To: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Silence documentation build warning by correcting kernel-doc comments
for usb_device and usb_device_driver structs.

./include/linux/usb.h:713: warning: Function parameter or member 'use_gener=
ic_driver' not described in 'usb_device'
./include/linux/usb.h:1253: warning: Function parameter or member 'match' n=
ot described in 'usb_device_driver'
./include/linux/usb.h:1253: warning: Function parameter or member 'id_table=
' not described in 'usb_device_driver'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 include/linux/usb.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 9f3c721c70dc..88c80289e51f 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -621,6 +621,7 @@ struct usb3_lpm_parameters {
  *=09be manipulated by those functions, with the bandwidth_mutex is held.
  * @hub_delay: cached value consisting of:
  *=09=09parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
+ * @use_generic_driver: bit is set to use generic usb driver
  *
  *=09Will be used as wValue for SetIsochDelay requests.
  *
@@ -1215,6 +1216,7 @@ struct usb_driver {
  * struct usb_device_driver - identifies USB device driver to usbcore
  * @name: The driver name should be unique among USB drivers,
  *=09and should normally be the same as the module name.
+ * @match: Called to see if driver matches a device.
  * @probe: Called to see if the driver is willing to manage a particular
  *=09device.  If it is, probe returns zero and uses dev_set_drvdata()
  *=09to associate driver-specific data with the device.  If unwilling
@@ -1227,6 +1229,7 @@ struct usb_driver {
  * @dev_groups: Attributes attached to the device that will be created onc=
e it
  *=09is bound to the driver.
  * @drvwrap: Driver-model core structure wrapper.
+ * @id_table: Array of device ids supported by this driver.
  * @supports_autosuspend: if set to 0, the USB core will not allow autosus=
pend
  *=09for devices bound to this driver.
  * @generic_subclass: if set to 1, the generic USB driver's probe, disconn=
ect,
--=20
2.26.2


