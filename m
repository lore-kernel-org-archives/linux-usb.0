Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E237472F
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821405; cv=none; b=E+937ch7ol6nIKLZr6O3AIDE9Qcirfw8ZFtz4Ku0aglUsXAz7MwzMQ+scZR2h8Pb0vBHBM6Kc+pb2/7GfS/7/B9yvJDCUwEL6ZE4GyBhXHHRjnSOachboSFvEugRKe0j4ML9kI0QQW6wVA4L+J1Q7OyhS0hfYgYZxGTXUQSq6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821405; c=relaxed/simple;
	bh=YkxXa7L95NopuQRDvJdFPY0Pb0SGtzjE4U693oKo17w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Izc0AWrPU8Sly7chS8E8lCy/V3jHeQv7vz689l/IBNLD6PZcaJsiDDVGG9Fl3ae/qia5WWGc4Afl61Eod0hXPgWbTtXqrWu2ajMI1IA7jfeOe0QJmn212gd92hkrTnBeuBF8vjcjUyLqIfP7e9+wJGFFm0QmMWWKQpBjCJth3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLXbkmZS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLXbkmZS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49548e01d02so15740135e9.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785821401; x=1786426201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9H0G8wGK/G7J/VsG3O96wn6Q+Lkqndi1cJmBYpye34=;
        b=MLXbkmZSjWanITYuEELoW3nxuFPQ4DJ+kBR5BYynCsKM17F+5HGiOH1nFTUxbRLUZj
         MYuT7QNzaiKGbcJ261CZu9iKhND/S8+crFdYHRBth09URE8/dMxOhlXCif+exrtydkjx
         gT8x7l7MsXXs0KTYI5iNQSF41nALc1wDDo72dQCOdyAbODas3+nFPDDKoH9mcsZ6C6iq
         eujg5UqWsMgT6LvhSWbxujzzakHHXalTpx2BrnGCefq3r6ZdxZ3UN3S5EJbtwvkwKQyt
         fqV1z9A1wRG9MiQIlbDe2gww+LpewasjoEMEKj6VOPBROrbLQCWwA5p0n4Uarq9XXD+w
         sK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821401; x=1786426201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9H0G8wGK/G7J/VsG3O96wn6Q+Lkqndi1cJmBYpye34=;
        b=gRCcKxd6mLSC74q+NDzu3wIhsoN0U4SU+d39kr9Og5gbChN/EpNfrVs2K/PuA1Wmm9
         ss0XefM831bPYuT4vcLm4bxiqPqkGdXBSB0iBSzW2b7Z/Uj68hugK64mtKtu8Vg8f8Oc
         lZvKqWsz8WdrYbSh9dUj0zVNuWgk6WU0jPxolChnmEUnMWZeDGqd/7lkC60dxuCqlS2K
         pf4GivaLWpgKW+98j9KWYqE2T13ifpr1HFxmz/yVuDhJG1Z+mnqyRFtBWIV7KL7Z9YYg
         I5/Y5zQiHEnsfvkle4qV9mPcP7o9j6dwlHmG1Hw8SWRG3HszXtRFl4OSxpKDDd2UgZMS
         q02Q==
X-Gm-Message-State: AOJu0Yw+TyTYtbMCp4xU64KM2gxFvf9aPkGu+UbbQCUmkoYjdN6DFOQs
	rLgiD3FMggRpc6O2CaQT+fc6SrXhkYw+/fBV/B2DWLeSL4IhOZ8aUxcd
X-Gm-Gg: AR+sD12OIRuTYWHz9WCQwwBP2H/KYKL+J/Osi5nlCsYvRZ1gWLRS1mKVfaQpNUlSqZR
	1whh6fNZ4ugxhuZSkBRLC4wSlxsPfOeCD947sg0Ol18fLF0Tmb9aRog+Aq6zOx+uNpNu/PFRgYo
	fgh23oPyQ4m+O8n8qYF+WRQhQ81WdDmQRTkG/8In96CC9TtSfA9H5flrVD+Ry0zzQz13AfWepO3
	oji1jAEpMZPHH0JY6CqqJYo/YeUgwm5IjhSVLc8+E6leHG4eWagCEyLNJ0Dw+NDcGQkHTJj2yZU
	gPZ/BW9dAphp1EBmsEqHLOJ8L3BT8pro0Wbjxf2sWP1x42tVSAQcOo/Kt8HHC7Ui424YClAxYCc
	MXsoPeFu9PYr0e7PsA8QmULhE+nJ9/IlEvWGVVPSUKS1jC/zehO4f6Z+tGGyTaV96j9LokpCBMu
	eLYJ8+J773QA1Bh6KFqZf1tJVOTEnQ5ZmJ9Y8CfBALt108BXe1O0rv5jhXjO5sBw0N+rfxXrHBu
	qn7UTN8+bbvIC3DEF9/66SCzSYROmzrbdVWin7fPHWF9Zoi1typozDFKJnOekz3A8KFjfeiBCnA
	iZeQCeXrHS27m1QxUJa1PZh98VlusaPxhDZNABCl8uV+
X-Received: by 2002:a05:600c:c3c1:10b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-4980c672b1cmr228057155e9.10.1785821400825;
        Mon, 03 Aug 2026 22:30:00 -0700 (PDT)
Received: from riacini.speedport.ip (p200300fcd73d5bf61133fc1760631ad5.dip0.t-ipconnect.de. [2003:fc:d73d:5bf6:1133:fc17:6063:1ad5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fdf392sm91693335e9.11.2026.08.03.22.29.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 22:30:00 -0700 (PDT)
From: Rituparna Warwatkar <rwarwatkar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rituparna Warwatkar <rwarwatkar@gmail.com>,
	syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: uvc: align XU descriptor pointers to fix kmemleak reports
Date: Tue,  4 Aug 2026 07:29:47 +0200
Message-ID: <20260804052947.15277-1-rwarwatkar@gmail.com>
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
extension unit is removed. The problem is that struct
uvcg_extension_unit_descriptor is marked __packed, so these two heap
pointers are stored at unaligned offsets. kmemleak only scans memory on
pointer-aligned boundaries, so it never sees the pointers and reports
the arrays as unreferenced.

Unlike the UAPI struct uvc_extension_unit_descriptor, this is an
in-memory staging structure: baSourceID and bmControls are pointers,
not inline arrays, and the wire descriptor is assembled field by field
in UVC_COPY_XU_DESCRIPTOR(). So __packed is not needed for layout
correctness and only serves to misalign the pointers.

Drop __packed and move the two remaining scalar members (bControlSize
and iExtension) ahead of the pointers so that baSourceID lands on a
natural 8-byte boundary. This keeps the pointers aligned and visible to
kmemleak while leaving the structure hole-free and the same size as
before (40 bytes on 64-bit). The bLength..bNrInPins prefix is unchanged,
so the "memcpy(dst, desc, 22)" in UVC_COPY_XU_DESCRIPTOR() and the wire
descriptor layout are unaffected.

Reported-by: syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54927260acba030187a6
Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>
---
Changes in v2:
 - Rather than only dropping __packed (which left padding holes and
   grew the struct), reorder the members so bControlSize and
   iExtension precede the two pointers, grouping baSourceID and
   bmControls at a natural 8-byte boundary. The struct stays 40 bytes
   with no padding, and the bLength..bNrInPins prefix (and thus
   UVC_COPY_XU_DESCRIPTOR() and the wire layout) is unchanged.

 drivers/usb/gadget/function/uvc_configfs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
index 9391614135e..049fb9e14e4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.h
+++ b/drivers/usb/gadget/function/uvc_configfs.h
@@ -172,11 +172,11 @@ struct uvcg_extension_unit_descriptor {
        u8 guidExtensionCode[16];
        u8 bNumControls;
        u8 bNrInPins;
-       u8 *baSourceID;
        u8 bControlSize;
-       u8 *bmControls;
        u8 iExtension;
-} __packed;
+       u8 *baSourceID;
+       u8 *bmControls;
+};

 struct uvcg_extension {
        struct config_item item;
--
2.47.3

