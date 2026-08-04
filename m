Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0A44AB60
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837844; cv=none; b=i/UJxiVokF4nQDF7LwVO5oPfBNn96S9JIROjs3gsyWb2+vC+zRLm83CsutEHbaCIWACzFkwboZQ4xd3L498c2Jv/yKpm45PYC5pxl37w9kxzU/YYPTIshQtsxuZ+Vc1sIX2AmqfSCCKOjJqDVuabBLSz42LUtNtoLqRrp2pySUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837844; c=relaxed/simple;
	bh=V5RWXyjpVGh3i0A+4CrqmjGtiyY6FHhADkCnDHoo5LE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOFecYwNZhYE776vcUI801U+8c4SMneItBe9rmXsF/ipZtJDd2mOeO+VnR3/xmISgeMoV9yarIV4KagWRt/OBQiOFYyJGI3b0UP3ii88Xw3AxHpY1hv8VJnKit1imFS1nBCtKg3EO/miIO+f15XS/9Yl/OPm9REnOc0RACAgEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEJ78mo0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEJ78mo0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso14625895e9.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837840; x=1786442640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5sbX7LPbmxKznY3becilAKwjNokPaVAppuK6EGQWgc=;
        b=gEJ78mo0Wk6/V0h43f0Jf319a07aSgL0/aOjrMdAxVZq07t9BRhXTiLhgkNnBnmn1G
         /b1klYK6DE8mPnH/t+f6eQtiMJVoikneHhNpVjc/zTs2WHKBtd7mgZ5uOg/pky47F6Zs
         C6aH8wRckp2ZJ23L5ue9asrmbu2jWyI4yGAo5bOnF01+UROoVC+H5VtT2eluW1iieN+5
         p8gNgoYAxtKH2yNLzew5Ic12GPPYtog+qVrvPOKebufN2BiKglbhm3iDF9UESA/z4/Qz
         9aMbSAiZMHVzzrRIJXJzoycZtsi4icEgPJtS1XzQ5DMYkaCvQl5Xcc2b9Eyv4DuliBi/
         w1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837840; x=1786442640;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5sbX7LPbmxKznY3becilAKwjNokPaVAppuK6EGQWgc=;
        b=AnHysPSzTJFloJD5MkNUHU4MqFwdSblF6t4zgn38v3kds7E41yTOWqoawsbJTu+t4x
         uJRKqKUV3P2QFOSHSxZJpIXqRT4943RLGUaQHs5tKiz8+JNGDuqjnd/hS0DnDJx2KWYt
         +e2e1DDjCw1KNFwV8MQkneZqZbRKWzHoaWqqqwv606Rwc2TufqPEVAcWLoh8+giD8HyV
         evZ6A7JZevPLOvx85d2mHXOg8bSkDx1h62MONnYX71VTkpfcS47hinrMUhyUhG+2dQbm
         u5KnLGJ90oqs1+DQO+5MfJx6nad114TJG8ewEpY6nW1HZRsNgUQLEFDmdPLieSrKa8XJ
         EEkw==
X-Forwarded-Encrypted: i=1; AHgh+RqA1Opb0I5do1DEJ4kRadPPIkhyaTWVtHAQNmS0lkU5MoUVG90j5Tawn0hV0wsXYaZKv0YkrZOolG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztJsbZjW3tIJeuZIZ7TKYXihHX27/RvMfSaITGcPDSChV5skkU
	fLs3ac6/fBEjSTZcJKPk/+uGbuNNhJLAak8YWce/MDq8gvs3Cy4R+lfL
X-Gm-Gg: AR+sD11DNngI7C75+pRljuz8ocM9zUdfNeURI5ulw86pMVTdQDrkiLuYkkvsJjrcMEk
	EalQ1elUR/TDrcuICTm0P8DOCOMJxFcXtdHY9f6UXsSBFB4UqmFDneGq5+vXdqqItpBes8PQwHZ
	qcgPkq4ExcW1UEG9LOCjha+VgfE/zxUXTgopgXLH4bBYG2d/bg2dNzSHsUUkQEdbgjQZ4qdtn1R
	5Q2Aio0IJEBn0JskxUURBYoUo3ZcRUHxwchfHQFfTg5E7QGRxJuIiKqgZrvnqgQuQjJvidJudit
	boqNnlHY082AgWKyzlPOPVsGQpexG2nmMWl9ZONRfpEnfdd23nN9Jb55EdsYOwxFGHG/oZrHT3p
	XoguXg5CUcyQHGMdsMUwmRI2D4zS4+oUdrxFXZQNCzK2Op8OT7fyST7zZZ4afMcaG1exLcmlYm8
	WYjIVm0/CS1hjjwCJDlglFBopYx4iCyGaRmumw4uWPzjvYUuFhYvikOeCPLIGFHKO3cMrHquQN
X-Received: by 2002:a05:600c:3b99:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4980c66d8b0mr317127735e9.4.1785837840308;
        Tue, 04 Aug 2026 03:04:00 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd8919sm69114595e9.8.2026.08.04.03.03.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:04:00 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:03:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] usb: xhci: Don't set the skip flag on non-isoc
 endpoints
Message-ID: <20260804120356.470fab4b.michal.pecio@gmail.com>
In-Reply-To: <20260804120110.01bda0e2.michal.pecio@gmail.com>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

These events are unique to isochronous endpoints, ignore them otherwise.
Update debug messages to reflect new policies. We could also log invalid
events as errors, but it seems nobody has ever had problems with that,
so don't bother.

This allows dropping the isoc check when skipping TDs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8eed56b72c30..8270c63ec3bf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2759,16 +2759,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Set skip flag of the ep_ring; Complete the missed tds as
 		 * short transfer when process the ep_ring next time.
 		 */
-		ep->skip = true;
+		if (ep_ring->type == TYPE_ISOC)
+			ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 "Missed Service Error for slot %u ep %u, skip %d, try now %d\n",
+			 slot_id, ep_index, ep->skip, !!ep_trb_dma);
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
-		ep->skip = true;
+		if (ep_ring->type == TYPE_ISOC)
+			ep->skip = true;
 		xhci_dbg(xhci,
-			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
-			 slot_id, ep_index);
+			 "No Ping response error for slot %u ep %u, skip %d\n",
+			 slot_id, ep_index, ep->skip);
 		return 0;
 
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
@@ -2844,7 +2846,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		/* Is this TRB not part of the currently executing TD? */
 		if (!trb_in_td(td, ep_trb_dma)) {
 
-			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+			if (ep->skip) {
 				/* this event is unlikely to match any TD, don't skip them all */
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
-- 
2.48.1
