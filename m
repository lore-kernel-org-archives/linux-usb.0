Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33600440A05;
	Tue,  4 Aug 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837191; cv=none; b=FGq+X8sDF0t2XgTYAO5IgNHCMw9jssZPb9v/KvDUCkTqhe+BqzKYodcLX0/wIT/6X/44kfyLtk16+BgPTmCy5CygmqPioUyWA5hoHByX2/hqbq0r9RsKmTx022FI39erZaTdxJ66WoSC/Rrzj0ZPjDNXlpD/11s2IjXGEEpQroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837191; c=relaxed/simple;
	bh=VYZNwUqh0wpC9nO8W94KR6Tf+kTBbLcGsqKUXw5gJVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WoLb/isa84P4UjQUEYtGzNy9GffLlJC6EM+0DW/oP6ywlFVdcuJN6THDHfTYPmM9tB9jArLvr6jEJTIhz3G/+XGaFk5fTHPVPFKar0SIsLO0QRbTCMofK+pv2DGcQJSoVamprFLcOUOKZZT9EixWRpyqlFpkBYq2EjPrljTQM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 464ff3cc8fea11f1aa26b74ffac11d73-20260804
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ce313c3a-4702-4cd6-9a07-b943515d23b0,IP:0,U
	RL:0,TC:0,Content:100,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:125
X-CID-META: VersionHash:e7bac3a,CLOUDID:a7b56a122cf82944c8efa208c21aa2b8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:850|865|898,TC:nil,Content:3|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 464ff3cc8fea11f1aa26b74ffac11d73-20260804
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1416585727; Tue, 04 Aug 2026 17:52:58 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] usb: dwc3: gadget: Fix use-after-free in dwc3_gadget_free_endpoints due to race condition
Date: Tue,  4 Aug 2026 17:52:55 +0800
Message-Id: <0ee247a4142f77eb8d38581d0b31beac7621b474.1785837121.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dwc3_gadget_init_endpoint, &dep->nostream_work is bound with
dwc3_nostream_work, and dwc3_gadget_endpoint_stream_event can queue
this delayed work on system_percpu_wq when a DEPEVT_STREAM_NOSTREAM
event is received.

If we remove the gadget, dwc3_gadget_free_endpoints makes cleanup and
the memory allocated for dep with kzalloc() is released by kfree(dep),
while the delayed work mentioned above may still be pending or
running. The sequence of operations that may lead to a UAF bug is as
follows:

CPU0                                      CPU1

                                          | dwc3_thread_interrupt
                                          | dwc3_endpoint_interrupt
                                          | dwc3_gadget_endpoint_stream_event
                                          | queue_delayed_work(system_percpu_wq,
                                          |                    &dep->nostream_work)
dwc3_gadget_free_endpoints                |
dwc3_free_trb_pool(dep)                   |
list_del(&dep->endpoint.ep_list)          |
dwc3_debugfs_remove_endpoint_dir(dep)     |
kfree(dep)                                |
// dep is freed                           |
                                          | dwc3_nostream_work
                                          | // use dep (use-after-free)

Fix it by canceling the delayed work before kfree(dep) in
dwc3_gadget_free_endpoints.

Fixes: dcfe437492e2 ("usb: dwc3: gadget: Reinitiate stream for all host NoStream behavior")
Assisted-by: Codex:deepseek-v4-flash
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/usb/dwc3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa0f16ffafef..fa944856f956 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3508,6 +3508,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
 		}
 
 		dwc3_debugfs_remove_endpoint_dir(dep);
+		cancel_delayed_work_sync(&dep->nostream_work);
 		kfree(dep);
 	}
 }
-- 
2.25.1

