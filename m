Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57781A681E
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 03:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778902502; cv=none; b=lcGM9twzup0Xg6fi9s0S25sjY1fTUA5jWUqPCXkQ/haaI+Ni2PkzSvan1JpDb8Wrw4SdqwVKIB/PBQrrhvLmUCUwQ9kUjaxhSJZi263SLsSoDm3Vsu8tQq2z+LYxyKS807qME2pbXbfwV697E02o+iyxiIVJKTI5QTOKCrC9z3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778902502; c=relaxed/simple;
	bh=1ek1V3qNwjIjbLeMUwhJIvFm9CvDWkGS7S4yTY7y4Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LaSGmwBntyaeBJquNg1y127mcpqqz97PHYNbNerlPA+p3qFEma61mxiqfLpJMwN5YvrpqkKJ9JPSzfOBSiye/KvI4s7ztwgGsazae50fcgLUM7znR+aUypOcGTQWiDhiHSHsMZnu/GIA+84ZEUUDWrUMg5GAHglwcBYrdUrWziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoA+u9wr; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoA+u9wr"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so215119a91.1
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 20:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778902500; x=1779507300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVBB0YqRiH37gHeyI5iQH6aOmoxv16VtWYvfhJx/4h8=;
        b=ZoA+u9wr9kmsz/6HUP8lYz/NCZY2F+fjP25uLPQWt6RoLbvn5yU46y2C46r1+DLyu4
         KcHaPJ/BsrwqEz0Fm/vuYDX2QrtvqFO8a1fQ/sBYZi676mmeyzo4thflxkv962hp2Z/g
         taYhv3vIjRTe6MN2UNtj4ZLtKA+7Zwf+Yn6ULZBu2gm9g0vi0f78+bivYFTYAT9q5u7W
         ++M2SuzMgGa1Qzk+3kVu9e0Vsd0wPsFX3XiJCZDcUZOdliQdChba3BRVPbwDK760Rxis
         jwBq71Tkq+SZxa3A/qO+rv4XxyZJZwaePB263JALIWGXI9Oc8jrg9Zqjh/x4gtW2OGhM
         wN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778902500; x=1779507300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVBB0YqRiH37gHeyI5iQH6aOmoxv16VtWYvfhJx/4h8=;
        b=Ws2nEKvGZNcSOlt5jFzRkBouZQ2W5s4I12xDYkJJEgrwLDVI+dDr73J9D2/hm9bL83
         HZymcFbbTnksZu5DeGbIlCAb1pvVON2YdknNS1RcJ0nXL2aH8XVvGufv7yRImJpB7FmD
         Z3o6zKQ1ulEsZbg943f8//fBRXNNnWAvA8iWW8H53jzeel22g4ud+UV4bhTX76Sm/rx5
         eHjrT/6Av+tZbvsGTD1TXp6af0p1UisZC4n/+3qXFi843fovsvxgrCw6/DfofgLGIjF1
         2CnmOAJeRFT4sTwhw/lQ/zJhiOqnUoDRDq5ZIwx2LtCPhUfFslm8p9GRw/qFSEMXbwyS
         289g==
X-Gm-Message-State: AOJu0YyJk9C61dGb2mJRwIVe7LuaNOIoirSkS/0A+ztaQSHKpdELHvM7
	ewS41mQETBAHhJF1RW2AaSHC4f9pYBkA7prLH4FaIbQlajKmi4rAbMpf
X-Gm-Gg: Acq92OECUK2T9vCFAFNeS1FVQaPW8PcrlJCaOqZL+PvsMjHCUsAfnDvffxCLrYLQbS9
	Ww0255hetMUSJdHZvbttXDoMACyIZWRo0sFI1S2Y4HzJQ1hDLbuLFteHn8LC2D4YGBmbMAPXJN+
	Ji8G04pC8ZYKyRUnjhix4trJzxv52vWwylBRhtoz4fNCG1OxWcJhHPI/m8BEnpgSmyvs1PurrEg
	sMZhcyZVumjGdYs4pasqOs8hNPP2tTVarCRJieN2DWAEd1P49SrhNNlVddWKI/NBN1hpZovuxrB
	5W0pT2korXCEAQnO/5Omyjx22EKTDIwOTU8Hskm5qLfhwj5N3y85Xbc3H79hNaOSTazSR66F5yz
	sMGxSzupASrkT7FxdYu1Z0Tk1l9Rb0/PI46yCnmUAtidIyS7a8za2H+G+ZC516YaouopXsCQTDV
	oWmp+geI1EX8q11SpmQVQMXD9Rx8pYV5U=
X-Received: by 2002:a17:90b:57e4:b0:367:b819:2214 with SMTP id 98e67ed59e1d1-36951b82d4dmr6800897a91.13.1778902499997;
        Fri, 15 May 2026 20:34:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517d8570sm4296873a91.14.2026.05.15.20.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 20:34:59 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] usb: xhci: fix USB2 roothub port count clamp
Date: Sat, 16 May 2026 11:34:43 +0800
Message-Id: <20260516033443.3646966-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_create_rhub_port_array() is passed the roothub whose port array is
being built and the limit that matches that roothub's descriptor size. The
limit check currently stores the clamped value in xhci->usb3_rhub.num_ports
unconditionally.

When this helper handles the USB2 roothub, a controller advertising more
than USB_MAXCHILDREN USB2 ports leaves xhci->usb2_rhub.num_ports unchanged.
Later USB2 hub descriptor and status helpers use that count to size fixed
USB2 descriptor and status bitmaps.

Clamp the roothub passed to the helper so both USB2 and USB3 counts are
bounded before those paths use them.

Fixes: 9a7ad750a8fb ("usb: xhci: move roothub port limit validation")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

---
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..2545f96fd1ee 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2182,7 +2182,7 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci, struct xhci_hub *
 	 * descriptors aren't longer than the USB core will allocate.
 	 */
 	if (rhub->num_ports > max_ports) {
-		xhci->usb3_rhub.num_ports = max_ports;
+		rhub->num_ports = max_ports;
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Limiting USB%u root hub ports to %u",
 			       rhub->maj_rev, max_ports);
 	}
