Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A26443ABE;
	Wed, 22 Jul 2026 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708272; cv=none; b=pn9eS7mStQGwyLKK807uudjB/CMW9Wbvmihr8GmnEuSpQkLnWMvwgeIqIplejMUGD/KjodykTb355JR+edr1OEiA35cCMRPX+BH/aEvprH/H01SUH3OFsueCHpL8mrai5ZwHn6PQ80PwkvhhmOtEHhehR5b5V69Lmp7yI7twarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708272; c=relaxed/simple;
	bh=OF3Cq69qZx3fkwUF4/0JWrcaffAYoEBCqZX5meMCaiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSLC3r7BeeAkshxwpxG3DnZAvtaVwS3L7+Y4XyXTykwnwqs9rErDMfX3YxacC3DXZEQB+G+WPnQZ0u3RsEMMcpIZ9xgUaLQbkxsxYXhARb3CHmDoLbonKVKwJ+PjDPlPDIZfZtmNfqtIyyd9SKTDPUMnTzLEMpmcbqzus9jtGZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JCD5GxpU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BDtYuQ0M; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JCD5GxpU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BDtYuQ0M"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 81B10EC00D7;
	Wed, 22 Jul 2026 04:17:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 22 Jul 2026 04:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784708270;
	 x=1784794670; bh=pvw0sP9Y33TGVp2zd6A7xIHYROXt66eFd4Fg3nT9Jbw=; b=
	JCD5GxpU5r5rD2UVOSiV2M6a7v/0glGqFSXmaj/VCZZMz+Pp6ep26D2jEqMJg8lC
	hj9kBiMLHB95bqgwl7szXgDvSi0PPp9N5rC3dWen92zYWA2Y2qdGFnRu7DasPdtr
	KQImGBuOeMlyWU73W6tfP5jP3rs5zpBkpUPCj4s2xiK1JBQL2DghkM0hxS9bvldy
	cbeD+Hwy83kepIJgqGJdFc9Eds8I72xZ9jShdd7nxGy36NAMZ4FVSetwGFYsTs4n
	hLPV7wpzmQXwiW4geCeLffoNB9JJNX3EvtyIBU/wO7HvfbDrZFpiX4AHx49uSLM8
	fUuxDMUBFJ5YfgTsUQ0uBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784708270; x=
	1784794670; bh=pvw0sP9Y33TGVp2zd6A7xIHYROXt66eFd4Fg3nT9Jbw=; b=B
	DtYuQ0MCatfZs1ef6zzOrIipD7jeTD8zY9E+SyrKcQF5YzildDa3m8pyYxnH6/9S
	RTe7ALzrN/bAeWjVmeocxfPRizShrHz/iEDuefDeUEURJxcGRaCrqqj5gtUDrxzo
	YTeVEvDPHKj0S+mbyFBbv3qmvJ/OmpzJDtlYiKW2RIKsxMp8Yv8+0ywouAmWD9fb
	mk9aKvLJH2hOGsJbOQ8dNOYdRYYEfpaTm+WSEFCRy7GhxKQ5DfVOeoaPZ0agT9Hu
	9PEifI+AFZwIcMfeDO9kMPIxl01kk63HdWvOnYek7LhxfTFiUassHDBWVIDg9Zz/
	dYqMo0RsTBvIvKbxurCqw==
X-ME-Sender: <xms:rnxgavVowcq3CVoqXvJ66RZpUgdAyAszAi_pjNjD2kA7GRuRP1WhNg>
    <xme:rnxgalgWu6ajoyKS-OFjREFdJfnTYasnJ0FkKIaTg_wGWY03dh1bAfWHOAKaTd4-a
    C4Ct3UjTOGDCW1Ou9dJ_XD9Le7N1hlhLryHYqXBBb3YPj_Q4w>
X-ME-Received: <xmr:rnxgatvUTPTCO6w0f7YBrnT1610q-9sI37iN_D4C6njYeyPHKXz_ixfO2St0_MxGX6F06IgR1HupYSmTkF51EseXgzpxYMWDMA>
X-ME-Proxy-Cause: dmFkZTFePMTx2K3lOG86P/K5Fxb4/47Da67zToW8WFfNqYuwznzIeuZfb/KMPgbrTEmeAg
    Z8rDZBohPIaLlIc2L924ymJ13OT/XwFJ58H9h9vfYwFUPilIJOKgXY0fdbnrtapdx0KN4A
    UPVsQzAZAfbLisbttJ09fC+O4hMNg4CO0u+r6JwFQcn9xPuTLW3WEPovXFtNS6RquMWfKP
    xzP3YLDlXkHSdbTi3N43g3WHyzbfZ8UyMQP/cX6RBlWfGqEM5mg9OxcUgs16FLheTNXXxq
    yLO0Ti5Vkf4Nv7Nm2uGHiELMvMG2t1/tbXzOwKl/HFfBvruoploQekBl1oOeeHoyXToHUj
    Sfq/SOJpvsSJrvu/MUMf121IKFKv9WLq+XZx3bvlGRDWR1Z1Eo/Gs0x9AXn6SUeuef9S/Z
    ENUOYNU5FowZ3oxliW+PVM1KSeb7UADrq4cUs8c52CDnhcDJY40hLCB4GQuTgoeouxuKvV
    6DqIbGbDERae4pKYtV1z8Q4FJMRRFI/otLkl50A9G29O0XuaDkPvEUcr2ofZRYdaqlzpBj
    8h0ck+rP5yhekRaZo8HtS+9u1OqfaH0y1q+tEFDM6lhWo6FLvuu4OnyZPB4+Z6p8kByfEB
    geAziNUp3pxVSBuzVlAQkWVMDgsspLDSPcdCU1oGnaFgsA4HmeEvjN5NzlKA
X-ME-Proxy: <xmx:rnxgau69mngdP0cSlTRirxnuyE6RqXV6I1GIhqTvqz1XLktdyQiT8Q>
    <xmx:rnxgahMi3L9Jze3w3CZB5dgTexzV6SFjNbzh59v2_k35uUqQowS44Q>
    <xmx:rnxgaktjUcGCqRT2jhxYLvOXlRfZaZXtqDxNNuCHn-oCJD876TVw3A>
    <xmx:rnxgasbHMJE51RKG0VZFGorX70gby5YuAsN1RNjqj5EMUluC4pqNqQ>
    <xmx:rnxgaiE7PRWxULDjZxehoZK12PLIcrGpIOkB9D_Ig0zjL44ExXiXOaeQ>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 04:17:49 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 22 Jul 2026 10:17:40 +0200
Subject: [PATCH v3 2/2] usb: core: reformat error handling and messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-usb_core_patches_2-v3-2-87622252bfdd@kroah.com>
References: <20260722-usb_core_patches_2-v3-0-87622252bfdd@kroah.com>
In-Reply-To: <20260722-usb_core_patches_2-v3-0-87622252bfdd@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784708266; l=1834;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=OF3Cq69qZx3fkwUF4/0JWrcaffAYoEBCqZX5meMCaiU=;
 b=QLVqn5IGLvmaqPBFkRxSvcmuls5bJCOzCMeraqGH8MAlnYBuP5/pVK1Rq7BlZ54tb5YWleC1a
 rnBW4arM66iC5zthJu2TG8m7Ow4b1/b4HHwOaSn3flyNHyEOcm4uW1Z
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Rearrange the error handling changes in the previous patch, in both
hub_ext_port_status() and hub_hub_status(), in respect to maintainer
feedback.

Additionally, change the two usages of dev_err() in these functions to
dev_dbg(), and reformat the error messages to be more accurate.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 59b0e36816d6..94e268e791db 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -623,11 +623,11 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
 	mutex_lock(&hub->status_mutex);
 	ret = get_port_status(hub->hdev, port1, &hub->status->port, type, len);
 	if (ret < len) {
-		if (ret != -ENODEV)
-			dev_err(hub->intfdev,
-				"%s failed (err = %d)\n", __func__, ret);
 		if (ret >= 0)
 			ret = -EIO;
+		if (ret != -ENODEV)
+			dev_dbg(hub->intfdev,
+				"get_port_status failed: err = %d\n", ret);
 	} else {
 		*status = le16_to_cpu(hub->status->port.wPortStatus);
 		*change = le16_to_cpu(hub->status->port.wPortChange);
@@ -992,11 +992,11 @@ static int hub_hub_status(struct usb_hub *hub,
 	mutex_lock(&hub->status_mutex);
 	ret = get_hub_status(hub->hdev, &hub->status->hub);
 	if (ret < (int)sizeof(hub->status->hub)) {
-		if (ret != -ENODEV)
-			dev_err(hub->intfdev,
-				"%s failed (err = %d)\n", __func__, ret);
 		if (ret >= 0)
 			ret = -EIO;
+		if (ret != -ENODEV)
+			dev_dbg(hub->intfdev,
+				"get_hub_status failed: err = %d\n", ret);
 	} else {
 		*status = le16_to_cpu(hub->status->hub.wHubStatus);
 		*change = le16_to_cpu(hub->status->hub.wHubChange);

-- 
2.55.0

