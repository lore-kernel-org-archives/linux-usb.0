Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405FE400DE1;
	Thu,  9 Jul 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600373; cv=none; b=AFY1T37pkmPjFJLdmK6C7ADd2C3aRAvS9buRJ6YecHM/LSRz+jVYLv2ju49CpjiIj2apHQALF5FKekZwzbAz3oltkAQ2PkIpPu3T/VAV2b4Za/snzB2Rqq4Uei7Lg2ee9SrEMB/K1flSk8sgUnNBO4tXRe8kJW94VJnavBfqC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600373; c=relaxed/simple;
	bh=iG3oDWkpdroazOyP4u0SloMlo4lovTKomb7hmNhAbIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RBljg9IJI1av2dktSV7igwMs4Ax5simhhWyBpW7D1Ek7MvaS1Zm72lFWZTAj+YD6iVoJBZaw50d9hRjfhbPnabft4GGkcuW1DnVJVcHjWZiN+MYwj0MhZA9+6HavoS4qxKllCfx4aaWS819EGVLiy5sjDGqT/omwx4d8i8wfdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXu+LolE9q+wxEFw--.6599S2;
	Thu, 09 Jul 2026 20:32:40 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3] usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure
Date: Thu,  9 Jul 2026 20:32:39 +0800
Message-ID: <20260709123239.62930-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXu+LolE9q+wxEFw--.6599S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryrKw4DAF4UCF4DWryxuFg_yoW5Grykp3
	9Ik3ySgrWUXr47uanxXF15AFy5WFyxtrW7AFy7X34F9rs0vry8Z3yxtFWFqFy8GrW0kFy7
	Zr4jy3yUuryqyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

gaokun_ucsi_register_worker() registers the EC notifier before calling
ucsi_register(). If ucsi_register() fails, the worker currently only logs
the error and leaves the notifier registered. Later EC events can then
call into an unpublished UCSI instance.

The remove path also unconditionally unregisters both the EC notifier and
the UCSI device even if the delayed worker failed before both publication
steps completed.

Unregister the notifier immediately when ucsi_register() fails, and track
only the fully published state. The remove path then tears down the pair
only if both publication steps completed.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
- rebase onto v7.2-rc2, which now releases per-port typec_mux handles in
  the remove path
- add the collected Reviewed-by tags
- add the Fixes tag after checking the introducing commit
- no hardware test was performed

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ad669d2..24e859a 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -103,6 +103,7 @@ struct gaokun_ucsi {
 	struct notifier_block nb;
 	u16 version;
 	u8 num_ports;
+	bool registered;
 };
 
 /* -------------------------------------------------------------------------- */
@@ -482,8 +483,13 @@ static void gaokun_ucsi_register_worker(struct work_struct *work)
 	}
 
 	ret = ucsi_register(ucsi);
-	if (ret)
+	if (ret) {
 		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+		return;
+	}
+
+	uec->registered = true;
 }
 
 static int gaokun_ucsi_probe(struct auxiliary_device *adev,
@@ -528,8 +534,11 @@ static void gaokun_ucsi_remove(struct auxiliary_device *adev)
 	int i;
 
 	disable_delayed_work_sync(&uec->work);
-	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
-	ucsi_unregister(uec->ucsi);
+	if (uec->registered) {
+		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+		ucsi_unregister(uec->ucsi);
+	}
+
 	for (i = 0; i < uec->num_ports; ++i)
 		typec_mux_put(uec->ports[i].typec_mux);
 
-- 
2.50.1 (Apple Git-155)

