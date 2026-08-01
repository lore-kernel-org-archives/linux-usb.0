Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DF3A6B67
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785602279; cv=none; b=YJaeZDKrMj+NhhIpslpDmywn8ZvWS83L4VAoF35tu5U2PfF2sWRjMJit8lEZPy4knefSVHU/krvilFSlwcRKH168dD4iuksteB5A7RK36XHJnixvaeTCtA+siNri8jb7Q8O8dh/gxcbmZ+KEF3jGt4jh3j2TuWUCfVB8OEdfroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785602279; c=relaxed/simple;
	bh=jBFcsgxdsHHBtuj6y0A4tNj7euZVpJzFOiPD+w8Y0Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BO9i/YamNOq60K4TFXgbu83wp8cBVEjJYNlPz+ROItRd4eqAF7Z2h7mvSSSgsOXzXFxibEEa2gGtG0vDcONYHY33p00zlRy/76Lqq9iMbpVqFEy2WRPkYeeNooi/G0OgarLM/rk96zy1lWbcvwIy/j0ZYo8ARHi5oZ7uES+j+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rR1+xJJL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR1+xJJL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49548e01d02so3865765e9.0
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785602276; x=1786207076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aOkOfzHfwCb8la8nV7ofbFSb+oxHno2SRX3scABeu0=;
        b=rR1+xJJLR9kcRNtuEL7URIj0cfazNz1hwGwr6Hy0WERF/7UmTJza1gj3nHgbBDylPh
         Jl7roZM7wD6wgltIrkL2tumn8z1AectR9HlJrj8MDPoA+Hwswn5tg+cT9HKrHAOTxhoK
         b49/upzwYduxnX8ysY7kQNGquwJhEHWlo+NDA2R7xhmNNG1JP5BteW5I1EagY1fwbIF3
         qWhWeYo69gP8TtyBnF8fWer4xB4xqo5eD6IkPkcau20awx/qVtqZI2g96mvM0zgsFf4L
         T+NbA5SnrEuqIm4Hu9qEIEm4arC5qjgyy2PVlnt4pst3GO51cWOUnH1u63AD4LThCOwm
         YjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602276; x=1786207076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aOkOfzHfwCb8la8nV7ofbFSb+oxHno2SRX3scABeu0=;
        b=PFcEHkVCXR4rjI9ezDpytj4C1l92NI2d4vyq3h95Q7SWrHgTs26Q4n6MHAB4StRtlM
         W+zRw2oe3dz+d5ZfHkoUnteqwrBcb5+IHUnqmTWgldGAAsXtzn2nA760bCgZ7NKGgrB9
         1BJZR7RJos6RF7qkvBOnlpx6zKzYB2HRrBTpRv9wU32UPW3ee6fp8FCemrcT9stT13gR
         9stjfxbBMJOWFUraC6lL/3STWdgLMBQvzBwRi+dz4GMx6SolGnLo5+t7fAGOFSa3nWjq
         R7Rbo/qVtV+izoR7xsGaZxgapOf2StHhcSX2VJ1eir/t8hDGGc3rcdakGDbCpR1knKyO
         zBqw==
X-Gm-Message-State: AOJu0Yx0YW2cEEL37TvYvqYfmSpI6KNMN/uULlQTqxkKdw1OzPETo65R
	jMUtHinpMR6/ei9aXrlsnDrk70Q/8x7qJB4ycCZc4iRHWG6bDcL2iRsOJdcJdmzStRySoQ==
X-Gm-Gg: AR+sD12CrzpXlhmOoOj0x8MozzV/DeX0BTMkwq/D3Z+d4Hb2z1JASsmAYrrXJA9WI7T
	uQ+p9tRjxGiVaQFfnk3pd6rK2w8pdNAYs2CIN7V72vfkveA9FMmmMPpOm5MVkV1f+OZ9QHU38L5
	MaficecJrDBLC1hqAZ5+SZOk9ndnJrvL5Ac3oBcEB8DbQOq0IK1JSkYdBe4ssB6FDc16e2VtlwI
	uS3aCOZ9SrINN53JkD7qb/s3IRxtwUq/BkZXnOUWXNlHkkf3ytCUT+N6uBqHSTLjfRE9+yaHyXJ
	C89JU5KH/GmRC0EeW1KrEhaQsaKQNdNZXTcC8fWiRwv0gvMIkn6oPkTm1hb16rUk57ef5JHGGtN
	JUdmZerJHKFMMmzD689os6bJfIqA/YIrQKBYfozYCPhDtmtX+PfyzQC5yd0IjEJmAO4KgAxcCk0
	LJrL2f/uNcdno8g15+5XmWcTOfoIsfGznApebemqTSKzpfqJL5/mwwCZ+dqTf82p2YzsZ91G4aa
	CM55jXbCbhE+NyzZ2DCpqa8TToT4DfJ/1vFCuKe7usf42eRgr1BHsOvDLazBa8qImsDl6diW1+f
	ieu+aQ/Lh9tjioZX2fYERaUWTHgbKgomRz4Eg6gzlrnw
X-Received: by 2002:a05:600c:4e90:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4980eb4d5f9mr50698045e9.1.1785602276233;
        Sat, 01 Aug 2026 09:37:56 -0700 (PDT)
Received: from riacini.speedport.ip (p200300fcd73d5b958d916a1d293e566c.dip0.t-ipconnect.de. [2003:fc:d73d:5b95:8d91:6a1d:293e:566c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f0adsm66461855e9.4.2026.08.01.09.37.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 09:37:55 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Rituparna Warwatkar <rwarwatkar@gmail.com>,
	syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: uvc: don't pack struct uvcg_extension_unit_descriptor
Date: Sat,  1 Aug 2026 18:37:47 +0200
Message-ID: <20260801163747.82910-1-rwarwatkar@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmemleak reports the baSourceID and bmControls arrays allocated by the
UVC extension-unit configfs attributes as leaked, e.g.:

  BUG: memory leak
  unreferenced object 0xffff888114fee2c0 (size 8):
    __kmalloc_noprof
    uvcg_extension_ba_source_id_store
    configfs_write_iter
    vfs_write
    ksys_write

The arrays are not actually leaked: they are reachable through
xu->desc.baSourceID / xu->desc.bmControls and are freed when the
extension unit is removed.  The problem is that struct
uvcg_extension_unit_descriptor is marked __packed, so these two heap
pointers are stored at unaligned offsets (22 and 31).  kmemleak only
scans memory on pointer-aligned boundaries, so it never sees the
pointers and reports the arrays as unreferenced.

Unlike the UAPI struct uvc_extension_unit_descriptor, this is a purely
in-memory staging structure: baSourceID and bmControls are pointers,
not inline arrays, and the wire descriptor is assembled field by field
in UVC_COPY_XU_DESCRIPTOR().  Nothing relies on the packed layout, so
the __packed attribute is unnecessary and only serves to misalign the
pointers.

Drop __packed so the pointers are naturally aligned and visible to
kmemleak, silencing the false positive.

Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Reported-by: syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54927260acba030187a6
Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 9391614135e..5a882afbce4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -176,7 +176,7 @@ struct uvcg_extension_unit_descriptor {
        u8 bControlSize;
        u8 *bmControls;
        u8 iExtension;
-} __packed;
+};

 struct uvcg_extension {
        struct config_item item;
--
2.47.3

