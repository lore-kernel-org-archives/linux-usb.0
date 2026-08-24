Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17393384CCA
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601276; cv=none; b=uIe1F4Co/NDQ1ViLExyVZw7J/fFSPCJboaYHgm/BImqTurxdCDuN7epzRpQ6GZM4HhOBArGeoizjAqiOVhpdDeIR+b4A89EmddjIvDoNkQxtSQ+JUoOyweaz11/4+HIu4b7zbMqI1TKGv/nv10xuA8MZpdZm2JdVnJozn3W5AiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601276; c=relaxed/simple;
	bh=syQqtus8XTQIemj6XqP6dHTWlXmg4liBGXvcXvGFnt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUjEFYYjQx6SQFDAmUWu81f88oq3TGWW4MGCypkXwm8/Idg25YrBRNpp1fncGgx49MJyOoRlJiO+9vcc3LPLcpvNSdmQeUZ5rQzdl80KGamJDrNCKezLXMS0HlU0CCPCFENzFDhKmfI8m+Mc3g3UzhU5Qjziqq5Rv3zbMeFJbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LYzA6Q2k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LYzA6Q2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787601274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j3VLgoZqjZTBlEEMio8ckwxjiagBJVCAl98At6GUHoQ=;
	b=LYzA6Q2kDH7zRjvBq4aPd0Fj5Miwcf0SZbQ24NONF8NKOn2HJiBg2UpQWDtiDpbc2Gia89
	m/ObiBJPghU7qPCzUImXKTvDdUIZBUaNs/vyyQi/V/RQOUjyv0KWUR4IlgLaLwpYtwiSp7
	vRLjRZvLEP33xhT9To1fWogce5f68xw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-sDAndOmjODuSaBqmAlaXpQ-1; Mon,
 24 Aug 2026 15:54:31 -0400
X-MC-Unique: sDAndOmjODuSaBqmAlaXpQ-1
X-Mimecast-MFC-AGG-ID: sDAndOmjODuSaBqmAlaXpQ_1787601269
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 736F6184B38F;
	Mon, 24 Aug 2026 19:54:28 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.70])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CE45B7DD;
	Mon, 24 Aug 2026 19:54:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: "A1RM4X" <dev@a1rm4x.com>,
	"Alan Stern" <stern@rowland.harvard.edu>,
	"Christoffer Sandberg" <cs@tuxedo.de>,
	"Kees Cook" <kees@kernel.org>,
	=?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>,
	"Jie Deng" <dengjie03@kylinos.cn>,
	"Werner Sembach" <wse@tuxedocomputers.com>,
	"Stephen J. Fuhry" <fuhrysteve@gmail.com>,
	"Nikhil Solanke" <nikhilsolanke5@gmail.com>,
	"Vyacheslav Vahnenko" <vahnenko2003@gmail.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH v2] usb: core: Add quirk for Gigabyte Aorus Waterforce X II AIO coolers
Date: Mon, 24 Aug 2026 15:53:17 -0400
Message-ID: <20260824195419.234898-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The "Aorus Waterforce" is one of those fancy gaming water coolers that
comes with fun LEDs and an entire dedicated LCD screen. A minor issue I've
noticed with this cooler on Linux, is that we fail to actually
reset the device when coming out of standby, ish:

  [  281.652184] usb 7-10.4: reset high-speed USB device number 7 using xhci_hcd
  [  287.179843] usb 7-10.4: PM: dpm_run_callback(): usb_dev_resume returns -5
  [  287.179854] usb 7-10.4: PM: failed to resume async: error -5

Generally this isn't fatal, as even when the water cooler doesn't resume it
will still reconnect itself moments later:

  15:48:12 GoldenWind kernel: usb 7-10.4: USB disconnect, device number 14
  15:48:12 GoldenWind kernel: usb 7-10.4: new high-speed USB device number
     15 using xhci_hcd
  15:48:14 GoldenWind kernel: usb 7-10.4: New USB device found,
     idVendor=0414, idProduct=7a5e, bcdDevice= 2.00
  15:48:14 GoldenWind kernel: usb 7-10.4: New USB device strings: Mfr=1,
     Product=2, SerialNumber=0
  15:48:14 GoldenWind kernel: usb 7-10.4: Product: Castor3
  15:48:14 GoldenWind kernel: usb 7-10.4: Manufacturer: ITE Tech.
  15:48:14 GoldenWind kernel: hid-generic 0003:0414:7A5E.000D:
     hiddev98,hidraw2: USB HID v1.01 Device [ITE Tech. Castor3] on
     usb-0000:74:00.0-10.4/input0

My guess here is that the device simply doesn't support resets properly -
since that seems to be the only quirk I've found that actually works. Note
that the device still ends up disconnecting and reconnecting after resume,
but this seems to be normal behavior.

So, let's fix this by adding the USB_QUIRK_RESET quirk for this USB device.
This seems to work perfectly fine and prevents us from getting the
aforementioned errors on resume.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
Totally forgot about this patch until now :).

Previous version:
	https://lore.kernel.org/all/20260203221452.198682-2-lyude@redhat.com/

V2:
* Don't forget to sort quirk by vendor ID

 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b931c..6c4a52a693c05 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -217,6 +217,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x03f0, 0xa31d), .driver_info =
 			USB_QUIRK_DISCONNECT_SUSPEND },
 
+	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO coolers) */
+	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info = USB_QUIRK_RESET },
+
 	/* Creative SB Audigy 2 NX */
 	{ USB_DEVICE(0x041e, 0x3020), .driver_info = USB_QUIRK_RESET_RESUME },
 

base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.55.0

