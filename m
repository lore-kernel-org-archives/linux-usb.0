Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B8199D8
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 00:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778976476; cv=none; b=t0/UGNw3srXW4CaZ4qh4h66Ir7U5F4PejsIfR/0oj7vO0KHmRIFAKzdqFW3xCmEKxN8D4kw0zHFSq6R/b2cc5QgAo/kR3TH+gRrg3yEa+qAbZM2qW5EHvPUZvJrGLZo7SftGvxMr7b5I/46FUlNEEDUstpxpOC/NHZ7iy5eFAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778976476; c=relaxed/simple;
	bh=1BR63d47i7cdsymnhn5OIoWKov5bjNDKQfK0lCma0dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol1tiELyIs0UQdchlGscja3f1yRXK8juaZdxpx7yGbv1Pt89AefjRarK2iD/cyFFvzLy4kE7JT8DDpDtF44DAgzHig8eGL70yZKiwbjJidbXXrCWETR3FdWbQnGEDYrxPepWWdlLJ4rD7iAFwhvLwgkLtOdSG1cPF2YaIPlPLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI3/Qbw3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI3/Qbw3"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b7f937ef44so7127786d6.0
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778976474; x=1779581274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkDqfwt7wagaShm5M0ZiyWARHO0FrYIjrcW6gEBFvoA=;
        b=bI3/Qbw3W/rhYlW523TRGcc8owrV7AbTTpiCyiUuUgNVyG6ApdSpacxETFJznWKCZ/
         vjyFqD8FZx106bWkditvdfnbS7TUMKUDHRY9f2JcG0wSm3t8pdfWCQyhccZOuvrA8Kf4
         1aSUaSsnaWEe23Ijd/DhQ3l7TlZB4WeAoXibCbPIwVOKHjqrepifb/mlffXK1tZUf364
         Q11V6OIjUcsxG9D7V/khPLKg0eXnOUBGsYzyOYbttjskdPqwcZ9i9RIrEKIEhjj6hTyJ
         5kBEwb5uhRfBXlG+OJ7X9alIzYQtqDNYTMpMXViw9LWEsTnAF51RS+9t4inUxIm7rBx4
         aplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778976474; x=1779581274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkDqfwt7wagaShm5M0ZiyWARHO0FrYIjrcW6gEBFvoA=;
        b=Rfexr3sgcdABkAqmSn8G3VJdAcyQhqRLURGC5+qHSuxJ+dSqIjEw5C8JHkwsQKLKZm
         3V5l8LlcoGR8twn93BIFIs5bJDWhVEQhQ4oDWIiwNV8CKeNhgyrz8C2ZHW8wyXCjiRAf
         /l19JuonrJd0tzwosnm9mxEbyDLvGLAutBtGXZliRbvw2ONvoSABtl9WD3oOrBUYAjPM
         dbbqW0sN+aZbntpb1wGKht1w4O+zRp9q3YtXzYfmtzxQDzHqagy5UYTxRss95f4wxQmv
         MwJAaDfGeAgk5Rtf0kyh1An6e8UIp2Dzs8etZ6iVLW7OmO6JM7YGl/UFZekvELvB+jcy
         jqeA==
X-Forwarded-Encrypted: i=1; AFNElJ8q/eEbeQkDxF+Bu5y65UexVm3jlr/PLexsao6cyWLbTyVCOU7irJ8DXKi0bLFI5ewbH2tMhmdEFQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyfkh+S0RkgM8QM+sbNOi51vNJlc3YCT3FmPGWOrxdrRPwJs94
	SsLOKlOjCqznNKyxa1Mbk15Ex6jBmAkfhDr/bHKMnvft25LXcGGjTBinPR/k4/XJ
X-Gm-Gg: Acq92OFBhIf/0ua1MJSeWd5hCA6M/pJMlWy1TWhodpFLsuOuOvaGouztpCw8dARZ3JD
	Y3F4/Ut8tnD89lWXHFN7LR1rjqcxWW7RHDCQ8hSiIl0aPPSBcME7CGkLGYPP4OAD2eBDevDdKxD
	nQkHatR1GPnJR5YLHcFI2jHBdrwWYUSLVO9cbt4Etz3/8tY5Gu07+S49qDUuziC3nH/XosD2vlA
	RA6GKxR4VsZwRw0CLOwEx38QqCP9KrvDiRRu0QCrXHqPzQYfPP01nTkhdnpCCJ34OvXYG95rFFT
	NNSFkfXukRDOwy+uaRo4cy6AnovBF21/4j/WlRzUi3UUQDVmkcoOwI89OYTCyup4Esd3kojxMKp
	2pTcqYp+JWQlLuoTDPSclymDZLoPUU232XVBnRb61GHkYTnX0eSD5JnFZLlhmmbsLWFcPmUfnFu
	O4DguF3rCpYHntRBgJASZWwyF4zAPTAQpf9XUulLKv4fyFm3lyC3fqeD2TH5FX
X-Received: by 2002:a05:6214:5a09:b0:8be:6e51:37c2 with SMTP id 6a1803df08f44-8ca0f688222mr192687986d6.41.1778976474522;
        Sat, 16 May 2026 17:07:54 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3609784bsm3474226d6.16.2026.05.16.17.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 17:07:54 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
Date: Sat, 16 May 2026 20:07:31 -0400
Message-ID: <20260517000731.1869133-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517000145.1868817-2-eeodqql09@gmail.com>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `max3421_hub_control()` function handles USB hub class requests
to the virtual root hub. In the `default` branches of both the
`ClearPortFeature` and `SetPortFeature` switch statements, it modifies
`max3421_hcd->port_status` by left shifting 1 by the request's `value`
parameter. However, it does not validate whether this shift will exceed
the width of `port_status`.

So if a malicious userspace task with access to the root hub via
/dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
greater than or equal to 32, the left shift operation invokes
shift-out-of-bounds undefined behavior. This results in arbitrary
bit corruption of `port_status`, including the normally-immutable
change bits, which can bypass internal state checks and confuse the
hub status.

Fix this by rejecting requests whose `value` exceeds the shift width
before performing the shift.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Restored a paragraph in the commit message that was truncated.

 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0e17c988d36a..3d6b351dcb1a 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 						!pdata->vbus_active_level);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			max3421_hcd->port_status &= ~(1 << value);
 		}
 		break;
@@ -1747,6 +1749,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 			max3421_reset_port(hcd);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			if ((max3421_hcd->port_status & USB_PORT_STAT_POWER)
 			    != 0)
 				max3421_hcd->port_status |= (1 << value);
-- 
2.43.0

