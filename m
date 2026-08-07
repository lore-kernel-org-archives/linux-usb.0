Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B446C1D
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083899; cv=none; b=o2mEVNOPuF9XytBprLYSHZaQk2xWpznex0w/kCljZIe5dTLkH2ThN69yGHSTPP5AuowT2KqE+UKu+NjDFTzg6ch+aMuoMqHduRP21DuEQpu3dOdwxj+cassz/DEh8jHLvV1Efdm4DS6DvL7OoYFm1HlUOZs10alnZKl7lmFN5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083899; c=relaxed/simple;
	bh=tOoyzZIcwrg508BD2BSBqGUCV+F8iPOrOgSJDENAUAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUz3eEkjQZYZPgSnJHOdO33Kfcot6ioqLkk001fkD2Vn6J/0tnh/1uRi/hCDgM3No3pMbr4EHzAUjx2Xik+0OJoqdTniauEQxIlxDagBlffxqCLHD6Skt9mMoV6KdWXrnxrYt+4GVJReo6y824LFzKAmDeirSq7z9Ka3VyDk8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg6cFVLX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg6cFVLX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf27856f9cso38122795ad.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786083897; x=1786688697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=joY35scKKvUcuByv0iLOqCcjbK5xOHM5U+wXxck9JC4=;
        b=mg6cFVLX/uTmH8vN0srVC5Tt2eV2qo7gKp19UY4DdurNXl2cceWyfH/QJ8bjSw7Fk3
         D9YG1cKCXrj6Ljnn8YMgDUVWbcdmQXiL49BLwYCNiyniE1VEla2cBOooasR8uIUZ+L3a
         ReQrYaDM1VUtyuPyNTBRSAM9eg8AtqoyIp5eqjKjWY7gadzU/x2LKOEP+eoRdrdwAq76
         fudHfBHx7WBexQnfTXk6bf2KYg8f1ym5aho1cfVtAQfzhg8HM/AZ8SwOG0n6BaAUKNNR
         J4lD4hiGW2Xwx5TYvHCrN3pWkg4Htv+i+gW8KLSfGXleFucxMSMHpJFFI7XZ99gtIU4W
         +faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083897; x=1786688697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joY35scKKvUcuByv0iLOqCcjbK5xOHM5U+wXxck9JC4=;
        b=TtYG4z7T8wwnAtfFTqFvByBwDQb2a5/3Z53g/XOzMfHhUjqQZEYTDWtNTJw9S5THos
         MtwWh9bWwTC5uYweEIGSi2dRSoWOjqA0f5RRINu8KKiWT8HTfw4HRK4VQYF6+6/1usmd
         WTw6bNmfH7AQwZuOuQXWI+uhztyIJJCUu/zNjwxXrWMVYBNc3ABiuY2WYu/p88ofspeV
         2bSPejatoZMERQvSvcuLQQbnzpYkwdBlHtYvSVmQU28Mq7ofyVgosQYnQ/e7i4vrQQqQ
         nrNes/mYKX14G8LrBoWHvF2E+l77HlYqI8Q4L4hUJaKBh948sJaw2OJ5BIiItO0l3cD/
         cwDQ==
X-Forwarded-Encrypted: i=1; AHgh+Roj4PBxaMc3hEQtQblWwocJJSbX40cJIR5nEsjCOrm4Ldv6A795/1wnrjcb5tdAnpi5YESKxVXcE/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzocrP3vB427JBbgsNNPSKB1Utn/jeJH8EGuIEP1/4gUfoPrBWF
	UcWfaccus9XlrfzYTj+3T/Ja8F8d78400UeZRvJGSuwPsRiTlIemgT8h
X-Gm-Gg: AR+sD12/oS52xeJpetl4kRNpPmRwVsF8aUE5POFec8oJEBu22NZNj53ZHqftgSSq4hL
	Ssy60X7ULi44U+iRS1YCPnjsPDP94roXP9C5PQcXKTzIqaU2hJnrE+3L+kQeUb/nEYqSlgu4cfq
	GBTI13vKwXof/6mOrdiyu8pYGEwqFJzKxBC8kvhlfnEfWLqhiZ7HKlX/7NEj2g6/2a2z7QAy+Bj
	jKnYPFjIW8Kol5iGT97Pmit4qRSKnMLXINYI+ULetQD2eQ0JYJYIMY4OupgwgRLccO+D6h7fzMA
	GWRKkyveyxqNc1HJ8oyJkM4Ka6cNdI8+4dyavu6SGH6s8OquXpCIkfVnYZCmNHiC7U1fsDt9ijd
	WdLsBEW5KtCUlcguiaIBhKPXGNgefMPaqgAFmiRyggSfSGQGqLOavgPSM/1gI3lF8ZMCdCGx8bp
	AKBhZNcYvQEnXKaiyicLwBAL1TET3qu8k2p80xS2orKX8+zW23T1lmG9FdNQWwRt9/61A8zokUQ
	1MEoV095qKdKwN3RIcpwLqh8M7BRsiFJXvtSDafKVa2NbRhOta44CT76T0gD6ZKW3pjaatw+bIn
	8WNm
X-Received: by 2002:a17:90b:264c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3903c598e8amr22339777a91.4.1786083896969;
        Thu, 06 Aug 2026 23:24:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dfcdsm1043073a91.4.2026.08.06.23.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:24:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] usb: xhci: tegra: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 13:24:40 +0700
Message-ID: <20260807062440.24708-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Links v1:
https://lore.kernel.org/all/20260806063933.27331-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.


 drivers/usb/host/xhci-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..d7ae279acdf0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1571,8 +1571,11 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 		struct irq_data *data;
 
 		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
-		if (tegra->wake_irqs[i] < 0)
+		if (tegra->wake_irqs[i] < 0) {
+			if (tegra->wake_irqs[i] != -ENXIO)
+				return tegra->wake_irqs[i];
 			break;
+		}
 
 		data = irq_get_irq_data(tegra->wake_irqs[i]);
 		if (!data) {
-- 
2.43.0

