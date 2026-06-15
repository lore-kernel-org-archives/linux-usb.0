Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C593B14B4;
	Mon, 15 Jun 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506454; cv=none; b=QTXEOJzV27JBStiAK4GqtHk9Z/nXn7Bf3XTfu6yyPjzXEzl6joRhfAbWR953xhCxb9Vw8dvsoGRQIQvbDd+edH/WjPwTTf+dVByCnUSxmBFo5M0y6UIEij3/4ifBRWvaXTQCuMjbiTkfXjXghdhKFlcuNoU3jNzlj5k9ZkonRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506454; c=relaxed/simple;
	bh=RFjTKC+MeYIrDA/XfUIg9Q48u67yAwVMEVJGYHFHuHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUfSqmNs3R6cZE/5F1iq5CmeVbk7PIIXsYujmHCpKCfSnpmNIJ1y8oNLxGdpBkm4zeL+1BQ2zOFU5NTZsbhLaMbIL6rCeYwL3kbZEbfWNfHJjue4jVQFZzXXHhOO93RIY73Oa7cmT+pw5pdtxUCFEDBrKokDnL+gT97kXTo6vaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnAdWSoS9qBfWTEw--.24487S2;
	Mon, 15 Jun 2026 14:54:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure
Date: Mon, 15 Jun 2026 14:53:57 +0800
Message-ID: <20260615065358.93104-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnAdWSoS9qBfWTEw--.24487S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWfur18Ar1rWryrWF48JFb_yoW8tw4xp3
	9Ik3yrKrWUtr4Uua15XFn8JFyYgFn7JrWUAFyxX34ayrs8K34vvay8tFWYqF1UJr18CFyj
	vF45t3yxu3yqkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjnmRU
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

gaokun_ucsi_register_worker() registers the EC notifier before
registering the UCSI device.

If ucsi_register() fails, the worker only reports the error and leaves
the notifier registered.  Later EC events can then call back into an
unregistered UCSI instance.  The remove path also unconditionally
unregisters both the notifier and UCSI device even when the delayed
worker failed part way through registration.

Track which publication steps succeeded, unregister the EC notifier when
UCSI registration fails, and make remove only undo the steps that were
actually published.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..29d2e76b2fe9 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -98,6 +98,8 @@ struct gaokun_ucsi {
 	struct device *dev;
 	struct delayed_work work;
 	struct notifier_block nb;
+	bool notifier_registered;
+	bool ucsi_registered;
 	u16 version;
 	u8 num_ports;
 };
@@ -457,10 +459,16 @@ static void gaokun_ucsi_register_worker(struct work_struct *work)
 		dev_err_probe(ucsi->dev, ret, "notifier register failed\n");
 		return;
 	}
+	uec->notifier_registered = true;
 
 	ret = ucsi_register(ucsi);
-	if (ret)
+	if (ret) {
 		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+		uec->notifier_registered = false;
+		return;
+	}
+	uec->ucsi_registered = true;
 }
 
 static int gaokun_ucsi_probe(struct auxiliary_device *adev,
@@ -504,8 +512,10 @@ static void gaokun_ucsi_remove(struct auxiliary_device *adev)
 	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
 
 	disable_delayed_work_sync(&uec->work);
-	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
-	ucsi_unregister(uec->ucsi);
+	if (uec->notifier_registered)
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+	if (uec->ucsi_registered)
+		ucsi_unregister(uec->ucsi);
 	ucsi_destroy(uec->ucsi);
 }
 
-- 
2.50.1 (Apple Git-155)

