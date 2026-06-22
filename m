Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3081F151C;
	Mon, 22 Jun 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142360; cv=none; b=IaL2sepcEWPbknXqrUU/KaMt8oIZ2WpqljTKI2Dhz/q5lnta1SQxMeEx9HzBQGV0ucuRT0L7TvpTv6sz+uoDou+q8TbwmSnkKF4+Iba86yK44p0lggagzkdDoRHRIRrtp3kM5XInzIvredjSjKa5PY9hqGCjZNOw2VOiLp3mNjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142360; c=relaxed/simple;
	bh=i29rsuzlw1httsVRgajhB+83EYaRKyvfefht4c4kKrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3unEgABWA51VwWhH/+mND/FZhZ/xeWYXpZ0jZ/EjMw2OutOU/UMmOU8f6vkSGxQRea9R+7Jk0Lf2vSdGT2iGL3oLX/6G4tlHK7gayfm99F08mXamlgTUcMMia8LHw8ivEiwU8QzlBe9AzH0FnCZ0nh/3ziHcRMaoHyxBO2ve14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAAHrNSUVTlqk77BAg--.32517S2;
	Mon, 22 Jun 2026 23:32:37 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure
Date: Mon, 22 Jun 2026 23:32:30 +0800
Message-ID: <20260622153230.75195-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHrNSUVTlqk77BAg--.32517S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWkGryrCr43KrWkAw43KFg_yoW8Kw1xp3
	9Ik3yrKrW2qrWUuws8XF45AFyagF1xJryUAFyxX34Ykrs8K3409ayxtFWYqFyUJF48CFyj
	vF45t3yxurWqyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjiID7UUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

gaokun_ucsi_register_worker() registers the EC notifier before calling
ucsi_register().  If ucsi_register() fails, the worker currently only logs
the error and leaves the notifier registered.  Later EC events can then
call into an unpublished UCSI instance.  The remove path also
unconditionally unregisters the notifier and UCSI device even if the
delayed worker failed before both were published.

Unregister the notifier immediately when ucsi_register() fails, and track
only the fully published state.  The remove path then tears down the pair
only if both publication steps completed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- Drop the two-flag bookkeeping objected to by Greg Kroah-Hartman.
- Keep the existing registration order, but use a single flag that is set
  only after both the notifier and UCSI device are published.
- Unregister the EC notifier immediately if ucsi_register() fails.
- Compile-tested only; no Gaokun hardware was available.

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..0dcbbff5f205 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -98,6 +98,7 @@ struct gaokun_ucsi {
 	struct device *dev;
 	struct delayed_work work;
 	struct notifier_block nb;
+	bool registered;
 	u16 version;
 	u8 num_ports;
 };
@@ -457,8 +458,12 @@ static void gaokun_ucsi_register_worker(struct work_struct *work)
 	}
 
 	ret = ucsi_register(ucsi);
-	if (ret)
+	if (ret) {
 		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+		return;
+	}
+	uec->registered = true;
 }
 
 static int gaokun_ucsi_probe(struct auxiliary_device *adev,
@@ -504,8 +509,10 @@ static void gaokun_ucsi_remove(struct auxiliary_device *adev)
 	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
 
 	disable_delayed_work_sync(&uec->work);
-	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
-	ucsi_unregister(uec->ucsi);
+	if (uec->registered) {
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+		ucsi_unregister(uec->ucsi);
+	}
 	ucsi_destroy(uec->ucsi);
 }
 
-- 
2.50.1

