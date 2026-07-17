Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379E390992
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281815; cv=none; b=Or8xHIul59f2DRNuZptZLOQrFyS/dyo5SAFjoXULbQq0JfrgjsLa8/jPxdCxAZgKOfpZLBFBMDhd7+etFGmy5C/ngOpuL6n82tViQ/29Aqf7xJQZ/jbbofXeC3GdIAtqZBQMt1F7lFqyj/mOXXjAsUyOFehY++VvhcQLSJzHTrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281815; c=relaxed/simple;
	bh=bC7YpT9ESxLDoMaxGzhIMZGdoE+f+WJ4LDC/7lWaePg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwpsCTAplf5rT8u+tTAUbMtM6Ik7Nx1LMYhROo0krLi/NIRam8rDQvCkhGnGz4SLGLEGtIshUwqSIUsnBOMBd5Fc3Nq+ZboZTISxWcGiXlXkMFC1l0MA5tfVymJdure2s+FVSL/gMV+RYdyZ84ujPFoF6BBeVVPOS6nR2njSjvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CIycSEun; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIycSEun"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15b33f7b23so1119251566b.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784281812; x=1784886612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XD7Me5uj2XvXnDB/uQ2zJQ6z1KlcR/0Xv0ZRoQSvNBo=;
        b=CIycSEun7g2E/pqxQKSbpWYjWeRUoH3RuEfvH3hPpQCAFgfoOkHkGHycrz/GT4aiH+
         ZzvEzFbx4lBOwg//HR2L+VAShq2adJ6LmCVggKt46Ie4Cr9HAJyW2jE8dBm5chGPwb7m
         7bAdpMk4HC7qu34mbJYxgJ083zzcvkmWNB/G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281812; x=1784886612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XD7Me5uj2XvXnDB/uQ2zJQ6z1KlcR/0Xv0ZRoQSvNBo=;
        b=VlmgasqYWiU62QRMmcNxyXb/sGqkKGTJPBe29kVYWv6qIbKKmIkfPHv2aKA1VF/7bV
         ylTHK7/DvfnTyyDtVpaeZLLVNGoTflFk2r+SWeKCM6JCQXpX8lGpfC3almABvkHQ4LBT
         O04l15cSQdndhjaTVDzHNrFcx8pXjSurjBM5kLedvpHlJXWZf/TCtXEWUBMlcESXoT8j
         X75g/idQzeLSsrn9QeFFM/v2IFOkvtS0wVzo42mqouVPyKYk4owsW1jjR7BEcdzEchmE
         Qx7omieROcDJHTcHK5Y/LyX7X0eroii53/baaKYHFAzp63DhSIJmAtRmt/6gewmpqqp0
         HP7A==
X-Forwarded-Encrypted: i=1; AHgh+RqGpqIIOxMgQdrqjEyCcGZND4QxkQfCxyUAFL6yZHO4Fbrw7Efth2oHesy7x0j3XIdobc4l3JjWsEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3n4BXOsALW+ICWs60y5klHYKuiS1aOG3FarCcgAE2u2aW8GK
	eMJnUSS7lgFgk9JoaTf//3FWQoAfMKRqpYh2Vq7lPXQJubZf3Hy6zpDCwm5qWWemVA==
X-Gm-Gg: AfdE7clU45Rn9+MczV5sNe27/2eLPHpbhEHLuTTOvECqSuASeAKv1pSygod7Ct2LLdu
	o+lU9ECusIWTgoMlQ2BG42WXOxuwrhOLn2V5u6vzvSR8xhFOiAotg7HPqo360XJ/F7Y7hW0KeAa
	1D/t0DqfJanTQQdJIr4QZmMTqqvl6DD+ACyFYtya2uilBQgb2tNFyziZCbUeuCxI5GagabEBbrk
	xI/gYGtMkBxQvgjyC3qxK/btqAYwfHKGT5tFDMeAimeT96shZWx1xT5uYDapUTlHXZr5DOmCKdQ
	GrYqBPGNciMkoKHJl4RpPYXlNRwKJfSav10rwSPc7ST2YyRclxoluoqAKId01n6Phj/TMPOv0gb
	FEW46zn8UsJmvMrQge2cuoqNcFkc9VVmPwF/h1QYyyKApBXMrgf3gOvJ/WHd2NCFuKUfRvQhN1w
	u9dTlquFzyAioc0tBqRDpVbpkz+0Sf6ep2BeQnNiE61Ib2ru2X3t4BzXNavRHgEynFSA==
X-Received: by 2002:a17:907:c1e:b0:c12:9e83:643 with SMTP id a640c23a62f3a-c16b46ab9a4mr73127266b.10.1784281812365;
        Fri, 17 Jul 2026 02:50:12 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (91.27.34.34.bc.googleusercontent.com. [34.34.27.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009addd2sm48862466b.3.2026.07.17.02.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:50:11 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Jack Pham <quic_jackp@quicinc.com>,
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Correct teardown ordering in ucsi_init() error path
Date: Fri, 17 Jul 2026 09:50:06 +0000
Message-ID: <20260717095006.101389-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 7aa7d4bf9d3f ("usb: typec: ucsi: Fix race condition and
ordering in port unregistration") consolidated port teardown into the
ucsi_unregister_port() helper. However, it introduced an ordering problem
in the ucsi_init() error path.

Fix this by ensuring ucsi_unregister_port() is called before we unregister
their corresponding lockdep keys.

Cc: stable@vger.kernel.org
Fixes: 7aa7d4bf9d3f ("usb: typec: ucsi: Fix race condition and ordering in port unregistration")
Link: https://lore.kernel.org/all/22064276-6c56-411a-9f20-6917ceeb865f@intel.com/
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 1ae4224d2dfc3..49f1c53721bbd 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2142,11 +2142,11 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
+	for (con = connector; con->port; con++)
+		ucsi_unregister_port(con);
 	for (i = 0; i < ucsi->cap.num_connectors; i++)
 		lockdep_unregister_key(&connector[i].lock_key);
 
-	for (con = connector; con->port; con++)
-		ucsi_unregister_port(con);
 	kfree(connector);
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
-- 
2.55.0.229.g6434b31f56-goog

