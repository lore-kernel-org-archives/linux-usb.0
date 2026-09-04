Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55D47DD72
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522071; cv=none; b=Q+LicxuHjhVuysVKOP14L9zCurYo2TojGNYz8VMXCy7LBUZ2J2mkGyHEQDugppLwJiLjv4UGJo/+i2XdNXSbM9RKzbmAgdrVPNmUXk/fZzIo+FdVPmJFx4TCKi+Vqsu+LsV50ugjqj2h8MCHz+oRxDaGV0gywktv0kHNNZ+4mLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522071; c=relaxed/simple;
	bh=C1mL5wvuXeiJL6+qNXcEHLeUtrImx4Eb3dS/c2suAC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l40t2/6h3JfDPDXH3JCmX6wFy1js0vb5Zud6ju7uV+5FJz6I5QVMoJzL/3eKxXCc+fjLuKjRMXfJwGTFwzK8evvKlnNBozxQ0cvWSBu3AN0aF15CrU+YkS+y9P6kSbm47dGfYtZ5iT6iPeMt1ko1b6aVn3jdIncz/YkUZf9zA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdDv3Olw; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdDv3Olw"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so756105eaf.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522069; x=1789126869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MSWHQJd1wpok7dr+QgiT6g7ewt6hYaNecwa2k2Spr8=;
        b=DdDv3OlwkT2qOS6kyiYtyxg3Wj0+npa45z9bGBkdtsStYoZTzgffiGPxDx49UHzD3N
         oxkSV9WrAag6dA60LZnJDUb+nE5uXzvDoDcrElw3S2VTjv9gTuyVlK/Cn3hJ6KCWC2xN
         zeFocMAvnrz+xvnx0uk46eTyTo3w6k/lyh4gTd5vbDL1+zp+X/96ulUk4dCaiz4EPNvy
         5BA+gGeKkG6mHRf/sCZddHFcm0bEg6VVkdanaEE/LmMCI9SYuRHH2Lhlk5y6QCrXfsgc
         VxvxLewlDt4sYX4Jg+2AmmYkDgPwmsjGyGi+ZgnSUdz8FLK8IzADFF0kr0RuapkHXXIC
         5WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522069; x=1789126869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MSWHQJd1wpok7dr+QgiT6g7ewt6hYaNecwa2k2Spr8=;
        b=c0miZpykckbDyphx1nRLKQy2T1V4rYnWCm3nYEVBf7zdK02e0owqNEHlwjdObhJg0O
         RCTVajhqpxELZ3fWeSyHRwpXsLIwCR7B4A5Pj0wMDm9mxNFcaWQ2RINa67tl7ir4eTgS
         tM9AKHaOO/rktLr8XMHaCp5ks/AOIkyBM/TqncZP9LMq448Gw/qpvUR1d12BeMQfY3FX
         5P5zwy0txOtRETZhMRiKN050xXuKUC/tLM2w7JXT/irwS4es4hzfzhnPAJSxIAkvK2Lb
         z+VpE9N+8BxImIFnFNmLQa74/jNc356ehsIW1VLPfWVxy54+LyXVlfp1Bhwb5nFVN2ct
         pV0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgUwQluepElPn1rnBhT7J1541Xp4Ifhnan/gyfXHvuC+Wh8nGYoDsutzZZBueI0wAkhZJgcijAa6o=@vger.kernel.org
X-Gm-Message-State: AFuF++nP6ZYHOeVAE5tSAlB/gLAv4asJr6RDf5ZCaL8HXX6UmcDTytAN
	BZeHzZAZM+O2+CRqEJecKP4zjTOicrF/X1WZy246Mrap/tYSH+eQyaMX
X-Gm-Gg: AYBFou13X3eq8kAHiVVNzQf92xsoCqTVWPrgQpjqtcor/kZ5iTOp3GmXYgkuORs9yQq
	TL+os7OcNB3rh50FRSQWiLBnoK3AsVpQ0VcIYNL3GmiAFB8cB1b1tzOPCY9fMt2RXc/T3vymP7Q
	tF8zDcTGPahcXXRWMZKVJeX9RoMMTe8ir99/QSuAs1tndJsXj3ypDN9w7hQS4aK5M1MigxN/f6V
	dTNXVDn+dDtVrqFQ2SeBRLLn7unDyzoER2xCBzrwaKTOoV7be3v39sSX65TDqX8Qugqfmq3nG80
	dcx/f5xvjM7SFFMRYnG3L13epBBunKViLbl3+uxd+/8gSZxmfFB0T3Puzc5hHXT4Q5llfC4EELv
	Bp8ZtI/AkzALLZ9TuVTmgdxm1zxFfoXPI9JDO4WcHX5TdvwnkXLjwNsIhg3gEZDqnRwHy8AF1sh
	rojOXRiyyeNSiXu0yrByHZXAzatrLsnAAVrCcFehJ7FCzxByORlLcqtfS/M/Usfr91VRymIQZ1p
	p9F7oM2d9Hgbhc=
X-Received: by 2002:a05:6820:221c:b0:6b7:46fc:1ca with SMTP id 006d021491bc7-6b746fc0324mr1975976eaf.41.1788522068827;
        Fri, 04 Sep 2026 04:41:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm2695292eec.4.2026.09.04.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:41:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:10:38 +0530
Message-ID: <20260904114046.24048-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114046.24048-1-hemanth.selam@gmail.com>
References: <20260904114046.24048-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/gadget/udc/core.c    | 4 ++--
 drivers/usb/host/uhci-platform.c | 2 +-
 drivers/usb/host/uhci-q.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index fa2022e9bc60..0faa0e07533b 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -177,7 +177,7 @@ EXPORT_SYMBOL_GPL(usb_ep_disable);
 
 /**
  * usb_ep_alloc_request - allocate a request object to use with this endpoint
- * @ep:the endpoint to be used with with the request
+ * @ep:the endpoint to be used with the request
  * @gfp_flags:GFP_* flags to use
  *
  * Request objects must be allocated with this call, since they normally
@@ -992,7 +992,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_request);
 
 /**
  * usb_gadget_giveback_request - give the request back to the gadget layer
- * @ep: the endpoint to be used with with the request
+ * @ep: the endpoint to be used with the request
  * @req: the request being given back
  *
  * This is called by device controller drivers in order to return the
diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index f4419d4526c4..7967bb160917 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -21,7 +21,7 @@ static int uhci_platform_init(struct usb_hcd *hcd)
 	if (!uhci->rh_numports)
 		uhci->rh_numports = uhci_count_ports(hcd);
 
-	/* Set up pointers to to generic functions */
+	/* Set up pointers to generic functions */
 	uhci->reset_hc = uhci_generic_reset_hc;
 	uhci->check_and_reset_hc = uhci_generic_check_and_reset_hc;
 
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 9480d4ff0111..46b3bfe06adb 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -345,7 +345,7 @@ static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
 		goto done;
 	}
 
-	/* If the QH element pointer is UHCI_PTR_TERM then then currently
+	/* If the QH element pointer is UHCI_PTR_TERM then currently
 	 * executing URB has already been unlinked, so this one isn't it. */
 	if (qh_element(qh) == UHCI_PTR_TERM(uhci))
 		goto done;
-- 
2.48.1

