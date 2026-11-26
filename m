Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698113;
	b=Opx+vi2VrfGNeH1pVoM1YNFZRIj0+SBH5oxdk/CVUvWxj47I02Uhm75ddeXx+zJKKDbO
	 OEz2ceSjBB8KKoehWcxr6VxNvrp8FjjmQwotS3Eq7fHwNkLgHby36eFvPzDAzzF/xC3m0
	 LA05Ak+/u7AZPMUGydTdeSGGYi0QdHEwTbk/sFdQLGV2RK9PwEJP/Dknivb+5qd+XviF0
	 3Fd4sZmWKOhGzitQsJEpQkRE/XlJP7a+DyY9SfavUiQQ86iaaCk3RI9dn7fQbrIGX5DOq
	 6y8KvjU6nFdjjGTpZivQFaUyxFUqK8JNcDGrna1lICqyxrecey1FPQ/wNZmJhoqo/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698113;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7A0w2U4zoEdKpF1yE+p0krXFz4+YLW5OvXCV8h1EOJ8=;
	b=eaw3RbpagKNnuS6810Pouj+iB5YTg77/cpPtD2n73WwmMjqO8vx/3Pn0YqSjmmeo1Xg4
	 u8jc06U/JRcLE8oXMNRmUpjxis4DZKJAdGq/SvnL/+Dt4wuiR7iH/Ai05nYKO0fB6arGX
	 kUOPy8S9Go0f6B2vpa13TS9xXc4AL7Fq7P80SADT9iquZkwN8uNad1vkPHp2uvbwRZ8AN
	 ims/Ut6eFlJyVumKExl1ytmHgCLUy4V2tlbms8gukzfMjcU5A4l31kaT52v2OgIVy4IZJ
	 rffH4kNQMY6fqSWSmuO736UaFUK+1eb4nTxvAcnxzA4mjgvIgskDDcTUVU6YIONvCdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1pO0Wdd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFE606A332
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1pO0Wdd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC7D1F00A00;
	Thu, 26 Nov 2026 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698112;
	bh=7A0w2U4zoEdKpF1yE+p0krXFz4+YLW5OvXCV8h1EOJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A1pO0WddFlJjEduRhKh6rpVqv3sToihABP30H/e/lBnwsS+/8MtppwvoBYFk4wsMF
	 4K7JJ0MJnBbsgeAQt/IwuAt736R8YwdxauyUdc+H3ZXdkOMN0HS+ULnz7l/P1/KIlC
	 uHZTddDKsTGez3zzilZXeMTQvd2Yn5gBEJ94HNhbTSasvjUpC7Kv7gQj6an8kR7bAW
	 60feiCEkIyxiwNTy5D33jRMaw/MQ+ECaxYRLRA987FdsSY5GiP7jPjmMQypIkB3kvR
	 2o2rMgCLOOB8aWl6pdmq2ZMZdUnvhp1NLcpn76br1VMyFQGQXsx69PPn6AECbb0qWr
	 1KMiNh+/peCyA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Nov 2026 14:01:42 +0100
Subject: [PATCH v2 2/4] usb: dwc3: gadget: clear softconnect on stop and
 failed pullup
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
Message-Id: <20261126-topic-usb_dwc3_fixups-v2-2-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiazi Liu <jiazi.liu1984@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795698105; l=2357;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ThNK8sVifoyqJ7rKoJ3yPL7ikFhFkvIP8kF/crjh5Rk=;
 b=YEnZZZt0yxUOYV6/9zjLnErhG5z6KhIke+WIJR/Tr6QQa3+KqrBQg73sHLefbtCDKMKL9TSFU
 sK8nERF351+CKLqW0LMs43oYaZJ4v2NP5sc5mfhvZbRKdHVZEX4OOmt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dwc3_gadget_pullup() sets softconnect before its runtime PM check, so
a failed pullup(1) leaves it set while gadget->connected stays false.
The unbind path then skips pullup(0), and softconnect is never cleared.

Clear softconnect in dwc3_gadget_stop(), so a stopped controller is not
reconnected by err_recovery_work. Take connect_mutex around the clear,
since err_recovery_work reads softconnect under that mutex and would
otherwise race with the store.

Also clear softconnect when pullup(1) fails, both on the runtime PM
error path and when dwc3_gadget_soft_connect() fails, so a failed
connect does not leave softconnect set for stop or err_recovery_work to
act on.

Fixes: 8217f07a5023 ("usb: dwc3: gadget: Avoid starting DWC3 gadget during UDC unbind")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4fab2d57e7d3..d7e22b559876 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2884,8 +2884,12 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 	ret = pm_runtime_get_sync(dwc->dev);
 	if (!ret || ret < 0) {
 		pm_runtime_put(dwc->dev);
-		if (ret < 0)
+		if (ret < 0) {
 			pm_runtime_set_suspended(dwc->dev);
+			spin_lock_irqsave(&dwc->lock, flags);
+			dwc->softconnect = 0;
+			spin_unlock_irqrestore(&dwc->lock, flags);
+		}
 		return ret;
 	}
 
@@ -2902,6 +2906,11 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 		ret = dwc3_gadget_soft_disconnect(dwc);
 	else
 		ret = dwc3_gadget_soft_connect(dwc);
+	if (ret) {
+		spin_lock_irqsave(&dwc->lock, flags);
+		dwc->softconnect = 0;
+		spin_unlock_irqrestore(&dwc->lock, flags);
+	}
 	mutex_unlock(&dwc->connect_mutex);
 
 	pm_runtime_put(dwc->dev);
@@ -3130,10 +3139,13 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
 	if (dwc->sys_wakeup)
 		device_wakeup_disable(dwc->sysdev);
 
+	mutex_lock(&dwc->connect_mutex);
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->gadget_driver	= NULL;
+	dwc->softconnect = 0;
 	dwc->max_cfg_eps = 0;
 	spin_unlock_irqrestore(&dwc->lock, flags);
+	mutex_unlock(&dwc->connect_mutex);
 
 	free_irq(dwc->irq_gadget, dwc->ev_buf);
 

-- 
2.56.1

