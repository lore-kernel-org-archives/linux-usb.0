Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698115;
	b=45HRO4l1RTmf8mCi7Z2Qo/57d3H3vKvmTt4C5x/uVYKJRxO+pRQrAmJeB8KcEuv/sN5C
	 QpWvbCdoJo0JLvLn4VutK0pYVgz+aj0UBcFe2KdlLifI802fXINgoSoS692tLVXlHEvmw
	 OKAwecPQRNDAspwfTwKV+hzOHZ9ZVoN5aE+EN8NJ2HhDXMkwjkkQDHa77VWqWjJiBW7Gn
	 Q64+rfcdsRS0GD/3PACirNGjEIPUIiWjNKo8pxajvAXGsSyUQyKrNj0s5jsskpSjoPV1X
	 sSiuWvhIq+feJDD1emZxtAFplj+NGF/JZ7HOGexYutDqsbsIs8JZy3cMHeQSQNRWrSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698115;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bvrghLQL7ls6Cx7Io/Cas/1wlFor+YWLiK3/bwUgKUM=;
	b=YCaKwI/6VVhdpVFTAnUDSotPuZKErd4mzXswISNOGLmAv9DcqeTCzW91hJ5dNqfuBofs
	 kXBr5y9kOizmmE3zPH+DZbY2XQDH2U5LWvxE0FWCvIl4LbmWg/oDxvFHWw3pcx9jzDNt1
	 Zsvt96gSJ057k7RzwJ26yZvbwNtYzTOMbY5XC8NGGT3r5pKaFiwUp9q4chTT8Dt2s7w1u
	 83HCZWA1AjulnY58cJG04dIpiJ3nUDISWwForfB/Dwz157T84E2qD8klrnic/nhktVkmx
	 w3hFuCikeAE+fhqKzradBDidq52HxQCJg2I1y8vMwkvSHeflipYyJxpMEdrUrNQlu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJ5C0Qsm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F0606A335
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJ5C0Qsm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D251F000C6;
	Thu, 26 Nov 2026 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698115;
	bh=bvrghLQL7ls6Cx7Io/Cas/1wlFor+YWLiK3/bwUgKUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KJ5C0QsmnPm300BRWn9UsQvO5zgRky/AaiaBRFXiYnpZk6yiNMqzMaaoJmsQKA4rn
	 lt0aagoD/BN5q1EiIvt9vUUtJXIVASirrxOVzkAmQb6mDDPERCrEfS0ZDZE3BmjCHc
	 twE1CRsbuX3mXEWtU55a5ABLqNI2gEvHZIQCe4rURiWMUC7QpgAizJgwpsOfxA132L
	 YfWfCTJAn+FpVOAFilwvo8EEruz1D4E4G86aOr5ZphNj8tHbXeFr7AmMKfc59f19zV
	 9kUy9J92Ytrk4iNlzvUYaFc9Ops2FN49uTuWN7nv5z8CtNMS2Yqa7Pgv2Q7hZo32w9
	 6D1HRfu/5woBg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Nov 2026 14:01:43 +0100
Subject: [PATCH v2 3/4] usb: dwc3: gadget: serialize resume against error
 recovery
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
Message-Id: <20261126-topic-usb_dwc3_fixups-v2-3-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiazi Liu <jiazi.liu1984@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795698105; l=1201;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gagX8ODO+nMj50IZ/Dv+qdI7WffoJanrl5KbxkfSpZ8=;
 b=EaAOnzzZKtQ8KSUWvi4zTZofxoz9tZfkLYqrw9NeoCQtFsqkh4WUwIe1IzTihjLm5PGo5sgX9
 ROnFeoAvBHmAIG6xaFShPWrMPr/kpINvkOexQJvKMZZlzeuSie28EJH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dwc3_gadget_resume() calls dwc3_gadget_soft_connect() without taking
connect_mutex, allowing it to race with err_recovery_work's disconnect
and reconnect sequence.

Take connect_mutex before checking gadget_driver and softconnect, and
hold it through the soft-connect operation. This also serializes the
state check against dwc3_gadget_stop().

Preserve softconnect on resume failure so a later resume can retry the
requested connection.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index d7e22b559876..8f40e8dfa3f2 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -8,6 +8,7 @@
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/property.h>
@@ -5081,6 +5082,8 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
 
 int dwc3_gadget_resume(struct dwc3 *dwc)
 {
+	guard(mutex)(&dwc->connect_mutex);
+
 	if (!dwc->gadget_driver || !dwc->softconnect)
 		return 0;
 

-- 
2.56.1

