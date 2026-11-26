Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698118;
	b=ocaZFR135iokQ81Fx2U/W2X+t8Q5I4DfLLBcp930bV7WghN/U7iBKC2Db7GFS2kKwwR7
	 P1GnCUrWB6OsMweI7VA/hs1Fv+8LSumjxaBsCuKG1/9qZ6lP3TEYom42JIwKyrfxNm2nC
	 o1JCWEMqXgsLSBQ6bO02A4vLdPBycGLSkSyVY4TyHohX0KVXurS31NGfBpW+55RkFVM6u
	 0YgFiDWhfxCwjktO2YnTD7/rHoL4cS0buXF2cmyfjNA9pSUninnDSGMeHErM+lsbfKMBw
	 n+KYKs4xB4zcIEzFrPe5Wr5Uu4FhSiioGLVotZkGlsklqFyoFBUZNesHRaPKTQ6DFUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698118;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nt2snfUlvIINZaJGJoeZHDcbbcd+spWoto02PYxAyP8=;
	b=r/csBl0iXB2ZR+XcvlYO6tniy6GBxXhE52z0xN6xPGOYmeUPZaB5Oim3xP7sp3GtxgAQ
	 BhYahHXbGJSLgLhb1Y2uU+l1/vvYpe7eTGw06bc8T1E44BxpIkbUtBhEwsM81bUlwyy6M
	 rfxGhK5O854/gzYJl6guIythOkkcBi0ENdJavYeAy5mar4PTI/qreUgQl+upf6+SwNbMf
	 43QC6siV3jaD3nT0A1d04vAtpfptSNyUYGQSgwVprcwumJwMtQz8YT+iHgqxjbX6ILU5m
	 txhLYtNN2A7qapHDSsJ4XAMdy7vp9tYncxzQGKdTwkbS3/VgST5nNq059xmdd+o/aGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JflLiU+B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0289606A68B
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JflLiU+B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADE51F000D2;
	Thu, 26 Nov 2026 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698118;
	bh=nt2snfUlvIINZaJGJoeZHDcbbcd+spWoto02PYxAyP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JflLiU+BDZPwM1LkdHgHjMuJ+ryQ8nVZiWRKNbIKDvTYuCjwPtW4GhmFHmqsIKdxk
	 vL1XI+GzDwXlFlkxqG2pH99+PdC10MxJVUxmawpAC5C8WsqniZJgfIOsAp+5LVlt4y
	 vlUqgGCo/bhHkqUD5TSxgdJxhbTAHQRG6mcL7FLaKveiaOyqat2ztr+tJhjPbSTeiM
	 JWGgeeDTlUZwn0vJs+EhGw1L+XjDhA1+3BH8QB87gwDbFxTRXVbaPTJmkBJLz5Bciq
	 RZb0pLd2sxR2cOoXgp5f6dD57Xdz1TOLrqQ3VTgBS+8hbzItdCKqGTe/rFHwz1XRwh
	 KdbvS/LlC83bw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Nov 2026 14:01:44 +0100
Subject: [PATCH v2 4/4] usb: dwc3: gadget: cancel err_recovery_work after
 usb_del_gadget
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-topic-usb_dwc3_fixups-v2-4-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiazi Liu <jiazi.liu1984@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795698105; l=1850;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tvlYoBkirmhGdkH0S/llmMHUnOaJxV0Udcho4hwGxdI=;
 b=ElUZSsy7MvqMGcTrqZGUHMpCpUS+RJTKGcAhxcl3sn6BP6sPb8kr0fkONbFh8igffMhslL1U8
 02G4tTov8TfAGr6FPeyCuf5kx38jVKc/mwKfpwgl7x+GnWKj2k1uuQw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dwc3_gadget_exit() cancels err_recovery_work before usb_del_gadget(),
but the work can still be queued while the gadget is being unbound:

- The gadget IRQ is only freed in dwc3_gadget_stop(), which runs from
  usb_del_gadget() when the gadget driver is unbound. An interrupt
  before that point can queue the work from dwc3_check_event_buf().
- The unbind path calls pullup(0), which stops the endpoints. An
  End Transfer timeout there also queues the work, from
  __dwc3_stop_active_transfer().

Either can requeue the work after the cancel, so it may run after the
endpoints have been freed.

Move cancel_work_sync() to after usb_del_gadget(). Once it returns,
the IRQ is freed, so no interrupt can queue the work again. The
pullup(0) path has also completed by then, so the End Transfer timeout
cannot queue it either.

Fixes: 1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event buffer count")
Fixes: 61575534fb05 ("usb: dwc3: gadget: Recover from End Transfer timeout")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/sashiko-outbox-229992@kernel.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8f40e8dfa3f2..3c20f2ef6457 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -5047,9 +5047,9 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	if (!dwc->gadget)
 		return;
 
-	cancel_work_sync(&dwc->err_recovery_work);
 	dwc3_enable_susphy(dwc, true);
 	usb_del_gadget(dwc->gadget);
+	cancel_work_sync(&dwc->err_recovery_work);
 	dwc3_gadget_free_endpoints(dwc);
 	usb_put_gadget(dwc->gadget);
 	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,

-- 
2.56.1

