Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D147F2CA
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153250; cv=none; b=LbQeRlpSrbgFQQSfpuTJ8tnDVv1+mHWOGX3hA2Ywrkj1KHQgvqA8p3bDm8IXUTehjHtDRGRi14dY3/9+mvXtTOj7dntWMnidzKC8yX1tnXSU6Q2T65spCnWT3I5yW+OMcWvxQle8oy1XrwtoetOP+ctHAKaBF6DSNLmcK6ZO7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153250; c=relaxed/simple;
	bh=PybKD7oFEDWCFearhn6BczwAbDHlSd/P3rpXO4UYmJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWzD02YlhmUWBprsyo3KVfqtMEZrQwC8g6z7PxRIjDwHoDNxfKeit1ky3HjyQsZhEG/1g1hW7jPMSIjzu10CzIz6UXPRLwuL+JIRw3Btyksl4U6RsExHW0rA12g0/rVn9p8SebRVmWteAOLh4gq/V1y+c1I/L9BqJaSSEtPvFKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQlrFZor; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQlrFZor"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-487049569b6so4441497f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 05:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153247; x=1792758047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSmb6XGI1Gp1hjZxIN6yrwoPW6ujDDUYbz0vs1SVhBs=;
        b=XQlrFZorWZAYwR2BPIY0U9a8S0Jf+kX7dSqe7Fh+UfaIgkrXaJkyRHokoo+bZDVI2G
         KHY7yMyOjwl0WT7gGz5O+k8ZdnRi03JTdqySc2hwneSjHLAXY7MJqsFt91lhG0A+FLwB
         6vvMFe1NHzifiUnGeJxwAMhWTL0TCxVQe5JWIlzTalMkhSMA/VsY0iWv/kEuscfn/r9n
         tyXuifthFK3hO7L1P6r5LZBLcEb6qglPS9r3bpUl2aiHtujQPsOamXxq66ddx5WKUAFh
         M8bGiBDUgTezCrqT7ziRR+dSp01ajafLlorY8RVITOoZqeKp0fJixSg7ifE1bL5+WcEk
         Ruzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153247; x=1792758047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSmb6XGI1Gp1hjZxIN6yrwoPW6ujDDUYbz0vs1SVhBs=;
        b=d7wVsy0s4KVtq8XcoO8DQoxrBHUOgPkMBD/c2u3bZdxga0FoRF697PW1Zz9Y+PwsKo
         WbU4OZMpwdr65vdQcuoRlCLjWatV0r1ndA8QAtfDaTrCQuTPZXt2w//pigWGqyjlreXQ
         52pMxxkpYDD/5rv9AUIKz+9Nih8ZpY7m3NkVT2oOnjqnPnuPAhbg0vIQmOpyPnGeaZog
         rLCGqqAoPkvz/jcZpVQezscD3jil2yHrKzq3kjsI6rYEj6pH/4eQJysl9BuSINCujGnw
         H0bQCNMiHsIJ39DOhu6/Z/mhE/sFDfo/4rkv69/eHJFl2KH9m9UREcS2DO3MgvnzbflZ
         t1bw==
X-Forwarded-Encrypted: i=1; AKwUvBwX0Z61160xM4qgKuPb+ALz2I4KDF27eBJ1Wei/IPZduMCKgiOCzE1ubJP4LRFmVYTmPXDx0qc9I4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpG52EmejWjO2nbBk9SVHujGpgdgZVnAnZrig8uqTCTDiODMdb
	GlsMFEqYEMnTP6YwRB587eZm36MUmIvxszukkdWTn29LCI7DWDgOfP8NXgAV6YMt
X-Gm-Gg: AYBFou0Fw3ybvGVz83A0rYTqO4zlVHACMGeve1X3kYCTLHVjpWIpWCp7vo/MBH70kGK
	kKvacWfUQM6zZXsIlJePrxRnW2FHeR8t8bU1DsuDR3/N4uPSUea3QDLcoUOIJQkOcfMPh4/lmvf
	wKCpOpAscfQQVx3LiJQB8b4kv+4+7chVPQoEjCc9yt6TUaXM7hSpvVk1felI7eTazqSHAKbPQry
	Ep0Ez/RKV5by6hkkAXkmJlce+4/XIoluQ6ELfgqUUUFyS7cnAmBCLJiGacrOr4FWQkEGSfU06qj
	kJJPDIfb5G9yJC3eYpp6+wRIqeEKSK7frYU4WCH49EARU5A8Nr1BQWnp7nP2un+QDq+ThUxxwzQ
	H8nq4U6zfP9kt94FDa89xVTE50Tb6nBP8Gg/kRD2npGvT7c/CrNdLb0HtrAB34lerhpdIICGP8E
	3wiy8wJgRFI35sYxvBFEh/INNLtygbkjl+1LDVPTQu8EB8yeFtK2ug3l35Fkwt4dNK2tR64vgbz
	gVHe9OVpfwiGKKvYNkB8VNqOlt4SUmZP2VtbJefsbhP4ph+9OUyAgmb49m0ZlWHI2enEIAvhc8W
	i1b/JkdXb7UxEHXpt5VQ0iTbebP2joWW9LPQJf+MZw==
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr43716985f8f.52.1792153247234;
        Fri, 16 Oct 2026 05:20:47 -0700 (PDT)
Received: from cachyos.tailab2f6.ts.net ([217.180.53.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm4752728f8f.43.2026.10.16.05.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:20:46 -0700 (PDT)
From: Chaz Bailey <charles.s.bailey@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	Chaz Bailey <charles.s.bailey@gmail.com>
Subject: [PATCH v2] usb: typec: nb7vpq904m: Set client data in probe to avoid crash on remove
Date: Fri, 16 Oct 2026 13:20:45 +0100
Message-ID: <20261016122045.187862-1-charles.s.bailey@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nb7vpq904m_probe() allocates struct nb7vpq904m, but client data is not
set during probe.

In nb7vpq904m_remove(), i2c_get_clientdata(client) returns NULL, leading
to a NULL pointer dereference when accessing nb7->retimer or nb7->sw.

Set client data upon successful allocation in probe.

Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C Linear Redriver")
Cc: stable@vger.kernel.org
Signed-off-by: Chaz Bailey <charles.s.bailey@gmail.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
 - Rephrased commit message to state that "client data is not set during probe" (Krishna Kurapati).
 - Picked up Reviewed-by tag from Krishna Kurapati.

 drivers/usb/typec/mux/nb7vpq904m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index d1fa26ff44..52e3c9db35 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -396,6 +396,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	nb7->client = client;
+	i2c_set_clientdata(client, nb7);
 
 	nb7->regmap = devm_regmap_init_i2c(client, &nb7_regmap);
 	if (IS_ERR(nb7->regmap)) {
-- 
2.55.0

