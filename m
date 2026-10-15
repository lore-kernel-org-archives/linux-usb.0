Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22543EC83C
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036173; cv=none; b=CEymdN1VMEoMRLm44RN9zu9IYPKbMyXYsjRHrEN0AXr3ECd+U5HYJ4r9hITec0OuINbijJTuAx4slX96oqQTGj+oIa+cGZ1/HvS9SvvdpLgYj3CqTiOVbCbutQS88Sp5AIc9G81WcTWs58x3fWactDlhLGYkoXnWQevx1+Kp46A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036173; c=relaxed/simple;
	bh=Uv9EmrRaAH/Mht0c5liX9EH4uwX0CGeBWpQZZzd/SHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SgihYWVwmmAuIcHWtAPbR6j2xg8S2QgwgSeY3Aptoikqq5qujht3ENeJZr6NCc/vEoy6Fi10OHKIoDOvbutMqabfrMH/T9ZUrVIAoEaC/5E+0R4uLbyGvjOynO272ct6oNhgPDuAjLD4UTIGmPhzF5TR5RQMBvea+GgJzT58qkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXwpDpD4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXwpDpD4"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b55859245so72267686d6.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036165; x=1792640965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bunKBsFj9Fyqn3V/dhLLQQp1k0qDhFRte4iKdlCJT1k=;
        b=rXwpDpD4jdvmJxv75PaXNWHf9Et1+NV0v2hpyaUPvUpTn1eoeh8P/Z6GNScyZttVar
         VeiMuD0e8iKZo/FRc0iBcY5h0O4wqFUovWR1HxEPaDnGnR9y14zHQCVJAzMeL2pl15Ge
         mc+D+kTb9o22TkqJmEuTID5x5tsxhHurSi5JpD9LHjtwww/gRG9UqoDeFkUTr5MZhHSb
         DpRSgrW18ksIBwWJkjsaEfHLW0wNv/ZoLoz6uj7l7PwWPgCxKppXn2TY3GvrX0uc/4Ev
         OcPV6uZH+JvN45/h/T1ywdi+vLsRmpxZzhjkNwOtPm5tWpUz2xgr+YmNOldayTvGjqOt
         qi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036165; x=1792640965;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bunKBsFj9Fyqn3V/dhLLQQp1k0qDhFRte4iKdlCJT1k=;
        b=FtNZdrOHkzWpT6Kp1Fi4Ai+I7rRw0Wydoc5yTb4eAjMdeou3Eh1w0eXj8A3+Lx8W8O
         fRD34B+oLxVMkUKBPkR/bGKyLiXQWl8Nb7Pkq76seOrrwHwDG7Ai9/lz9zafTQr8sqsK
         GQAQXJpP2OoYsGGNMOGz2PJHv++7OfOm00JQFas3OfUAjIlQy+Lgg5glr9pQPIh6mrWd
         sut/sA9WF63s0nH9P6T+3MDODrNf3YOHYT9BbX/teEDEBlZ65kezt8+3NWiP8e0pa1eL
         9V+mHa+x0eYuzu2pgdNMwR284kZf9T1KOhVgtAoCKx1xMu89NGgdPFfDsIWZKcfBGpMm
         NXcA==
X-Gm-Message-State: AFq9FYKYjeAvh9hxwQjJ5jx3EDGKsOt1Qn8BbrD+4USnRv7oCp9mt7xu
	BYSZEd16UckUFSyf72bW54TtFL1ubHlQ5EqbQyRXGcD9xwUMZfzYvUk=
X-Gm-Gg: AYBFou1pe/eJa55GIL6EWjuI9Q3azkP5cqvWvk5Vi/Wtr3Qjt5S/sIRd24w/99dMT0Q
	/wk1TLvp+P1IJJY+s8U9DgufxLoyFh9NkSIGsX0ijQ9WzQvs029z/ZmjSBkedXuuBkXVghYiflH
	2Cok7cMeTtxok/ue91BOZSliQbwkgbFQ4OJRG0q6/W+GvyQu4Wtn3kpKC5ZS7c3/T7UovTzZ8KP
	oI3b42vgPdcszpS6Uo113TPzq9u6FN8ROdgIA3ixBhC4oRcU1PPnmAfxUgMiP9dRWROy++55pyP
	3g83COYWmm6un0iVPWvbao0RHHK5SsVOtfRT/GbYkwSFWvs/V3wJx73uuNtNJcB/lBWyzzOe/1T
	sSkaXfJZDwFEHnfCK2ChfRUR3TGQhxPh5dIwRHNrC/Fs2v/a7O/QNuDuxJzzKgQTo1GiMbl/N7K
	OUnFZtp0VFfCbHmQ+d0kk6QA0UJOUsOZ4wje8TOio9YSmimaTp6SXRfSr27txKNH5+3JcNIitFr
	TlxXTF0G46fpJuM/ogMVweGk7CoEj3vtFSZmUSjtn83nJSVolohwv7aNOXU++QXlFFN91tBBVEH
	/5LflCmurRSSOTmHvVJVtbZ9ZxrEjIQKKyox+ns=
X-Received: by 2002:a05:6214:5184:b0:917:8d8f:9d6c with SMTP id 6a1803df08f44-91b554c317bmr317474676d6.9.1792036165229;
        Wed, 14 Oct 2026 20:49:25 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 4/4] usb: gadget: pch_udc: free the EP0 data descriptor to its owning pool
Date: Wed, 14 Oct 2026 23:49:16 -0400
Message-ID: <20261015034916.2773248-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015034916.2773248-1-mhun512@gmail.com>
References: <20261015034916.2773248-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EP0 OUT data descriptor is allocated from data_requests, but
cleanup destroys that pool before passing the descriptor to
stp_requests. Return it to data_requests before destroying the
owning pool. Keep the setup descriptor on stp_requests.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 38b9159e2461..b07da0fdcdfc 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2984,20 +2984,21 @@ static void pch_udc_cleanup(struct pch_udc_dev *dev)
 	}
 
 	/* dma pool cleanup */
-	dma_pool_destroy(dev->data_requests);
+	if (dev->data_requests) {
+		if (dev->ep[UDC_EP0OUT_IDX].td_data)
+			dma_pool_free(dev->data_requests,
+				      dev->ep[UDC_EP0OUT_IDX].td_data,
+				      dev->ep[UDC_EP0OUT_IDX].td_data_phys);
+		dma_pool_destroy(dev->data_requests);
+	}
 
 	if (dev->stp_requests) {
-		/* cleanup DMA desc's for ep0in */
+		/* Free the EP0 OUT setup descriptor. */
 		if (dev->ep[UDC_EP0OUT_IDX].td_stp) {
 			dma_pool_free(dev->stp_requests,
 				dev->ep[UDC_EP0OUT_IDX].td_stp,
 				dev->ep[UDC_EP0OUT_IDX].td_stp_phys);
 		}
-		if (dev->ep[UDC_EP0OUT_IDX].td_data) {
-			dma_pool_free(dev->stp_requests,
-				dev->ep[UDC_EP0OUT_IDX].td_data,
-				dev->ep[UDC_EP0OUT_IDX].td_data_phys);
-		}
 		dma_pool_destroy(dev->stp_requests);
 	}
 
