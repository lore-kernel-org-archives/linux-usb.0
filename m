Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90772466AE6
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462982; cv=none; b=LjzVnwiYtaOdVfHlmToI34RULjQdVmjXMPAYj7TxrNBqkP+CwHWF0pv9FaMkecjFzt632ixxWSBUjTcsjNPwdC/9ptZNUszeSaSYlfaE98tTG6jFkFj1lJIDjJiku9tAmxisAmgrDhKFkehNzbYlw/0yBPR1mZJHnTBQNlAeMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462982; c=relaxed/simple;
	bh=NZRchLVy5n31XYbiS5i8BQVcxRXCGTbKv1t0C+lcWuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8w1Xsin0R2iYhWFCfXQTeoAnl88sOQUkfKDGZZH3de6eescxd5s5GejpCbIeNTtNtr/n3jenrG/qGgfIbEhj2mNp0POLJJNX53EJfCbSsb/rJBj4g5QsbFlhFijHseIawLiDeeDoApz/ZxxB75+45P3aWNsdQsvPHkQVzVTC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r63vqtep; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r63vqtep"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c0cd47bbso4625532a12.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462978; x=1790067778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=r63vqtepd53cEOx6fnhk2GMJuUhErH34LrZgVUhSFTY3r/1oS1as8t+bfGQGzn+8C1
         o36ZjLZU2UjIuUY+cnOoyM07KzBFh7MEkjxh0COVLMZqnxQNjYwfK3TM0vyRXP/wtr4+
         hKneX4S1r9gzPwWKH1/3YvrpFcbso9eXvkKosoUWeeIZUaq4xzGrSqW1pkG+J/uuzPTo
         7710zKIKrjBN+1vSG4GG3a03iBYKjHK4uPtLkvYvkEJfaefnDBDX8uSSJIHaXo38Doos
         BxsBnKQ1XlvXxaBjRZChqAtZoeOpcWH+lXIMFBx54m4frT9qF+achk+4U8I+TPuffqPn
         EXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462978; x=1790067778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=vYAYdzEl2an/mUkNXGtZs0QMKANE2Ox1OQlAJ2UoDw9h3gK46fwXJb0W1KFWNboG1R
         uF/R0DJzkyLTd3lB+cnkUKqnf6cNJPRo+3lpgxZl54cO92QCo+11UJGUCUNEIVfR3Ifu
         xPEuW2+W3omou2s8NRLEVZNNF3RlqS27qabMYc4dSNCOw1zw3lzOh+7A+IJaPX+A+ewd
         0TL6S/m9ReuhYdxn5GMgWmlDlIkYPS7lHRyXeKU0LPl8Jdk0I9sjxnLLTz5XcG5IKpG5
         p9HThvJumDVbTbhgQMIJsmYMPBeWBqopWHVCdzEX4n6lOO2Hk9OOOuBQCLfZX59zxP15
         8xIg==
X-Gm-Message-State: AFuF++kZ+8ZI74b/mXTnFI/vGYuTxoia7laMoUnIXmNXaKuH7FX/wH+B
	SQ16NG4lV01Tbg70K8t9TRftMhkUT/AzRhnbdgmAUeoAbsUwD8RSo1Dy
X-Gm-Gg: AYBFou1jET62zJp1WkrJBLMe6yS+IK6pLpiMHS2k0f+gJFSmpGW6LimPtMzNu4nVBtm
	J6IZHnCFF9A3tcYpjRkseUHIiDo+55DDfz4oeSf3z2vpmfk/4CdUEPka/NNittwaxXAqOfhkB4s
	PEAKTsSkV4NWjExnKzwDseJ3ZIySXUUQ+ZxcDG4xewp+hu32NC8KoJXGM9rLoGlzKWYZATK9+JP
	qXzond8mRNeM3g5aNbsLhpM9AYQOe6RQ59NbEQ5NENq7NyzX47yuCc7dcy14McHnbQBweMT13QT
	Pi3G9RhOpKgUuWz3woq1joPRiqhI5OFiKRAUgV3nElJjv40hKH6Ph16nMIRXz/FYUGUO7WrB6nz
	EfgYM97r0OmG8qo2xoK4haQ4boSExxbl7oHpcntNLiggch906D6c3Y4+ITrT4vaNDCMwt6Iw7zV
	8WCZs1wvwuGsyblnxFCCaX3y+lSP0I1RdIyo0BDryabi6qwwnYu12JMgUOlq/ul8PNPbBO00s4Q
	oaE+O+jbIlxVaZf4VuzBWaPHoRPJngzitde5sGGsBGQnHcD2X91Us2KzPB9w7hOpSB1wsrhAhDx
	RYlS9KR4zuls4CnXpHHkNmAckYkCkdZsmz+6BLclnivxcPhsWDB+titHhJ98YLqJggtrj72Jd45
	urLd5vDN0Z1+5pwchTBaNc96oi/H5tJ5raO9wPjlQETRjL6IAoSlB9hVx3PWwfplKQsq4bm4dr5
	m8WrFb763SsryI3aLXvTyK6Nd9oARSz2Twhe5TANrcEHJd35KPyeqKG2z7U2DE6Miggru4ac+1Q
	krTzA74vOk=
X-Received: by 2002:a17:906:f597:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c29b84c7106mr395967466b.9.1789462977606;
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 4/6] usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:21 +0000
Message-ID: <20260915090223.1346-5-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_ccg_remove() disables PM runtime on teardown, but doesn't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: a94ecde41f7e ("usb: typec: ucsi: ccg: enable runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 91c2958a708c..9d3ebb255de7 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1519,6 +1519,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
+	pm_runtime_dont_use_autosuspend(uc->dev);
 	pm_runtime_disable(uc->dev);
 	ucsi_unregister(uc->ucsi);
 	free_irq(uc->irq, uc);
-- 
2.47.3

