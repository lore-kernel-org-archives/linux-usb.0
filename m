Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597283;
	b=Kuezh1h1hwMWutmu2u34hzeltSBo7gd/Er/VYNc2May+TA0INl3uDF3Gk1cl2HGTCSPQ
	 WvB0DOAZFgkquFkPuePdwrHk+Wv1rSfOUHLRJ2LDQclthf+1bgoX0/+Vsw1Qdo5MzUJ9l
	 fGiHYIjirAN9O0J0uB2q/2maynQF1D835yWv4xAH3OMvYwexiNoysMKvTQjIdeS/mE1Ph
	 duRcLD9GkIzGJUP8gteza/3uPUPsF4W94jR3HdpvSkXxnWvjgTOyU1bJ1c9zxdGVDJhBH
	 s06beTPytP8pMszkinDc+O2lS35jryqJHwmn+xmN+54CXyCn2ysX/mlytxO0hjXroAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qS8Y3hnRR1CClfLw5wXG1RCQsL/qEy0x26Vl0+I91+g=;
	b=ZABNgzPge0/syKLaOVxpV5Fgz6AudQLIbCF/oxkaoCrLzG7NqFu3iSPzi5a2R/csJyfw
	 ekI9y2Q4xdOjn1onxETW/1EKzTIFfhcEIyXSXDGwN10wCdzke0VZEV5Wnjv0NXumOLxa5
	 N3w0l4ffexqNvCyoZ6WzwKsSL5L30u9EPI7q4IjozpvvRc0JrNl2LxQTIKxig/61OSuyn
	 E4RH9DSs6NFEJZyXOYbkKMLXcFeNii+Ku7KK+/cLeo895GuaN91T2QE9Ez95KFaFIYHot
	 D7S9zireMb4m5fGZEdOzc2MfspHqDBDB2X9FFuaq5CF6XQu560UytSux1oge3j6da8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LctFLDZa;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DF606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LctFLDZa
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so12474989c88.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597282; x=1796202082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS8Y3hnRR1CClfLw5wXG1RCQsL/qEy0x26Vl0+I91+g=;
        b=LctFLDZapI3+86voaLA0gO8PrYqVl0zyfdG+/NwxfM/9BuhYC9YtGAIwXOl0pnGOUx
         oEi3MKRHuNBtOogKxKyfqcXbIjFAqLvcwWFCcLYsTN/8a8A+Vo3L10tNwsSSRxYfLD8Z
         jZv7RVcGRTm85LSnihB3Px0Q9g6u8XR1HlOlrvljSxyvGhgtZMcl45rJB1kSW9XR+6Wx
         24w4PsJUuhTduJOM37T9XXXSMHU8yjwYx04YpSU7F8tVE7boHV9u2nEstEqyWZng72PG
         nvD5/qXlQyFRaY5ZN+Pej6LButTtk3ChR+kqwbFbQwncDes8b45vOcUohN3hUt4qKB64
         Dt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597282; x=1796202082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qS8Y3hnRR1CClfLw5wXG1RCQsL/qEy0x26Vl0+I91+g=;
        b=mk++GrMF6XmuhRXLZ0aeQQTZeaejFzPuhrdBUk72eKZbFlZZQ8OiHQBxoD+XK8n7Wl
         SCFLgGyJ3PM9g+3gv6igs34gzYtRlc9vuoSEhv4CByVxPuk9mLgK3i9//2zobM4QjKOS
         PsKlALu6Zl8oDl4LVjwWszwV0eVHTusOcDGY2lm07aqz9kev8XTyOb3o/JscPLsu07QP
         enUj3JWy+iFCYZbSzoOco9PVgcIA/1h9eNAXdpZE4Gdc+H1tH+6ZrOOMeUQIJPtti2g6
         0J2UNIsq6KPDLeybEMON5fDJO8G/cQnVfdG78Z6xq84A3tLx+cnWuMRrVECWQR4Vkc6i
         rtoA==
X-Forwarded-Encrypted: i=1; AL+hErGDOQMs6YGrT04Z9p3yff7K92ECqH1AVPg6u5XbskXGIMULz8reN+996lUTI/d/jcRaCmwP4VQoKh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KDw/WdKnDRaco+7orIN1j90YGM/au9YItT0k0dkro0y9HtBD6
	oQcO2N36KpNAGbA9o34gcvVQAM2VoQyr+m/8caW9pl3Lcitpqls5gW+r
X-Gm-Gg: AZFdTZfuiSUHYOEL9oDy38MdjBFEWK5+nunzS7oEUe6cDv7yR+ysiJp7FMYTlsts+06
	4wIDVQw/IRlA0lJDuju7hgv0FtllJ1g+Gvuj75zz5EI5sxqTeoRkSXXAbqrLjr3E8FBTId3FMRo
	LNp2ZPzMOfj1M6FJ5Qigg7hh9qt24M+yKvd0j44epUsFAa2J2VqB2B+JQ5LZMua42qXjYr6jSqR
	DgWSh/Fx6B4omRt92TkmLnJMYP91hvsw24h0WVcNlkvQ6fWeEkJL97sEkz6sp1INCyMXUulhysq
	cdf3L5VCj7/aKbLpyriQx0mA/ZVPeIRGt+3hA7QcO+93AdTfPS3M9bJJrAzwThJLxf9uEhCqdZg
	qz0bXn6UYlITE/NTK7dwu4gAMkGGRD34iBIC4L0Ddb76qMY7mN9UVeWc3Cw6ncU1GMy35TJHDrT
	4vrWcJUGhAxg47NnTcdRea4akw4FCn342xEXHkcbEu98YZiQS0Om7187+Vc7mk6EdIZKYY6TUKr
	Xfo6wBaIYJVJNNPHHbPuFS/eSIy8jEPR7Mav2EGxxYCkzq5cQQ6QEU0PcDKHV/5jsVWXVFRL3f1
	GNgQ0vjmY0LQvKk58de4r0mRs5+o7XcnQ/mWCUtUaLFvSWfxv1M=
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr15184719c88.9.1795597281464;
        Wed, 25 Nov 2026 01:01:21 -0800 (PST)
Received: from localhost.localdomain ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm46302854c88.13.2026.11.25.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:01:20 -0800 (PST)
From: Guoming Chen <chenguoming88s@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v5] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Wed, 25 Nov 2026 17:01:15 +0800
Message-ID: <20261125090115.2993-1-chenguoming88s@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075116.3868-1-chenguoming88s@gmail.com>
References: <20261123075116.3868-1-chenguoming88s@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cdns_host_resume() dereferences the xhci-hcd child's drvdata without
checking it, and both the child and its drvdata can be NULL:

- cdns->host_dev: cdns_role_start() sets cdns->role before calling the
  role's start callback and keeps it on failure, so the next resume
  still calls cdns_host_resume() after a failed host start.

- the child's drvdata: __cdns_host_init() creates the child, but
  xhci-plat sets the drvdata only in its probe.  The parent is resumed
  before that, by __driver_probe_device() when the child is first
  probed and by a system resume in between.

Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
only covers a role change during resume.

Check both and return early; the child's probe initializes the
controller from scratch, so power_lost has nothing to act on yet.
Publish cdns->host_dev only after platform_device_add() succeeds, so
the error paths leave it NULL instead of pointing at a freed device.

The resume-before-probe case oopses as:

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44
  Call trace:
   usb_hcd_is_primary_hcd+0x0/0x1c
   cdns_resume+0x50/0xdc
   cdnsp_controller_resume.isra.0+0x14c/0x198
   cdnsp_plat_runtime_resume+0x20/0x10c
   ...
   __pm_runtime_resume+0x4c/0x90
   __driver_probe_device+0x64/0x1a0
   xhci_plat_init+0x44/0x50

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Cc: stable@vger.kernel.org
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
Changes in v5:
 - Rewrite the commit message around the two NULL checks and their
   exact causes; add the oops call trace.  No functional changes.
Changes in v4:
 - Assign cdns->host_dev only after platform_device_add() succeeds, as
   reported by Sashiko; otherwise the error paths leave a dangling
   pointer.
 - Cc stable@vger.kernel.org, mention the system-wide resume path, and
   shorten the commit message.
Changes in v3:
 - Add the changelog below the tear line.
 - Clarify that 87e4b043b98a covers only the role-switch variant, and
   correct the description of when cdns->host_dev can be NULL.  No
   functional changes.
Changes in v2:
 - Resend with the correct sender address; the patch is unchanged from
   v1.
---
 drivers/usb/cdns3/host.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..b0269c21e339 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -81,7 +81,6 @@ static int __cdns_host_init(struct cdns *cdns)
 	}
 
 	xhci->dev.parent = cdns->dev;
-	cdns->host_dev = xhci;
 
 	ret = platform_device_add_resources(xhci, cdns->xhci_res,
 					    CDNS_XHCI_RESOURCES_NUM);
@@ -116,6 +115,13 @@ static int __cdns_host_init(struct cdns *cdns)
 		goto free_memory;
 	}
 
+	/*
+	 * Publish the child only once it has been added: the error paths
+	 * above free it, and a stale cdns->host_dev would be dereferenced
+	 * by the next resume.
+	 */
+	cdns->host_dev = xhci;
+
 	/* Glue needs to access xHCI region register for Power management */
 	hcd = platform_get_drvdata(xhci);
 	if (hcd)
@@ -140,9 +146,23 @@ static void cdns_host_exit(struct cdns *cdns)
 
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+	struct usb_hcd *hcd;
+	struct xhci_plat_priv *priv;
+
+	/*
+	 * The xhci-hcd child may not be bound yet: cdns3 creates it, but
+	 * xhci-plat probes it only later, and the drvdata is set in that
+	 * probe.  cdns->host_dev itself can be NULL, e.g. when the host
+	 * role failed to start.
+	 */
+	if (!cdns->host_dev)
+		return 0;
+
+	hcd = platform_get_drvdata(cdns->host_dev);
+	if (!hcd)
+		return 0;
+
+	priv = hcd_to_xhci_priv(hcd);
 	priv->power_lost = power_lost;
 
 	return 0;
-- 
2.34.1

