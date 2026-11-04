Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758497;
	b=zr61D2qWmrMEQNYgR6TzzIaxnk/0O8Fjnb1vEjy85MsAlgZ3yyvSJV0UOOOKZGQOlCPG
	 Ig3M2BUc4DN6iivOIwYRVLoHvqmcajGQ/oXaky6mmzfsS6luHOD80STUwxerDSN9jyEIS
	 jO3B3o+RXjqdBmHie35ON7L7lCE/E6NbHUsnBwTk5fk2/bnswGhd7jdyOkEkTe6E2EhO9
	 dQ6GZJA+bTPESSBVB4p+Dy0WNiwkzmXO4963UymA/XXBfO2R4VtoJY7QT/2s/eNyXQP9F
	 JMLP7Ky4WBR1USQFjlHYuPtwfpg54mAW/SejPdibMYQYBdaRSVtVjr/sJlRjEwMU/GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758497;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=VJfRFzdd5f7sOBUgZp+39dA2DxBP3NXONjDN81es+H0=;
	b=agxK8sO0SKxenbb1H/BOLF03d7DEaRkabPqIa7j7JN5v0T65wBMchVzpuyhkPH4W8GU6
	 Ru0YDLOaBdkNYmj54rm//qfIxcmT2OO6wEIJSQnDTZv2+YAYOCK79RNI30RGQqvkIpmbx
	 9R9WL2IsYVZjzVs4tQLP5xTfSiugGgmee00wzD5+JxDy0ryttI+tCll7Of+BaNymXeFax
	 YZRhQMsm5KwGwAZCmcTQ/nzybNyoI+LzEA/MeVGz8zYph67ealnLS+IasXnkR+2vuVFvO
	 +07SfJTG0U3lGjltK0OEDxNClE6TCdl2YsdRiJcJhzDnxgcE6jf4eTYD8WhEyNW/trQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDD606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBDD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAA3YPoelepqb3Y+AA--.29994S2;
	Wed, 04 Nov 2026 10:14:55 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init failure
Date: Wed,  4 Nov 2026 02:15:03 +0000
Message-Id: <20261104021503.1468519-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowAA3YPoelepqb3Y+AA--.29994S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GryxArWxtry7KrWDXrW5Wrg_yoWDtwc_Gw
	4rur1xZF1UWa4qk3W8Gw13urW8KF9Fqa1kWanxtw43uayUKF4kJr9xXrs5Cr17Zw47GF1D
	K3Wvka13u3ZrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUyZmRDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-m4YgABsf

__cdnsp_gadget_init() takes a runtime PM reference with
pm_runtime_get_sync().  On success the reference is dropped by
cdnsp_gadget_exit(), which the role core only calls once the role state
has been set to active.  The failure paths return before that, so the
reference is leaked.

Drop the reference on the common error path.

Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/cdns3/cdnsp-gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index e84405352caa..d3df4bc4a17b 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -2083,6 +2083,7 @@ static int __cdnsp_gadget_init(struct cdns *cdns)
 free_setup:
 	kfree(pdev->setup_buf);
 free_pdev:
+	pm_runtime_put_autosuspend(cdns->dev);
 	kfree(pdev);
 
 	return ret;
-- 
2.34.1

