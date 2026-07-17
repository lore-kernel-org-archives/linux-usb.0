Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115B3ED3CE
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285185; cv=none; b=oXgnoeE4IHpFjj99YKN/m14aPW3y6QzRQW5UUdKvuxE6b8tvnuyTHXZaVdE2Sl6mSOe1Ep1FMkhibjQrnhHo+Ffa0BiU+rmk6kn2gY/iL9biV/6fK0f3IU9eTpXa2sOWv6YFUTgbqDSw+mKZIvdkUbi6jkICjhp522CQeKqbNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285185; c=relaxed/simple;
	bh=Bu6ynCKZ0R7PBlqzGr8CS3vWxTyNWE9aRnYVfnWA7FM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CI2LaCahkAd0uIq95KJbbw4IGZ/QQy2wHvRKIoK1xT2iI4TP5GyCU2Vz01WshMtEC7shQO4jLYWosX3ZsHjRzJyO1Q7YKUoxS/4u8tKTXr+xMdCkSDnzen9JveIJUaw8QMIKMRGSnjzjeGSHYGCXrH3zp+mHmdfhiZMR/7nPTAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AVJmc9Sx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AVJmc9Sx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1691e4ec40so237703366b.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 03:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784285181; x=1784889981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNBp1FY7COTWRBaq8toEDefmotAUnsDCii/Qf5TL19I=;
        b=AVJmc9SxYlnKh/kv/wAcBkUlmyEunJ7mJPC6QR5EEC48KBAFFY6joZxqc17kSYj3Kb
         h8EfmjAMkPGHMqeGwB3w4D+Xy5Jmrx01JdYCk4Q/1+zAMgwn7PJCwi52YvjZi6Uirw5A
         Vmv9jhMinGf0QQDU+PQfO1cvVxFjsy/vBNwF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285181; x=1784889981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNBp1FY7COTWRBaq8toEDefmotAUnsDCii/Qf5TL19I=;
        b=ccMjJDc29iFvlMXXGhBgnYFliGPAwdUy4u5uf8CuxToMLkXQdd47Ymphon/CJ17Z7t
         EUeddJgPiwQF1iHxNd3Mw9a+1wzegQYe+c3FelXAth+yOUVkQ4uzevpquUppNrKbi0FI
         KCOqcIzMu7WMhJ69BV6MqeWzULJ+ERcB8xJWgMFg0tzKxM/DafUft3zfezusffaO9wze
         0B497Qc1eGJxYqy8G52bUAEHnwcOIJBAb1L8GMkJ1bNxMuSc/gRQagzFsAeRC2tbXXyp
         S5z/jf5wdqOwOfdm/bmW1akmCTWgfH9z1tgJJLGi913/CdgPaMUTvLuTKaThUsOciOA3
         h/3A==
X-Forwarded-Encrypted: i=1; AHgh+RoYJ3n7Dl5U5zD6lWrjRIFjwt7xBXP+8XTkZGdUASqPDVwDHPJHvl7+Gu1I8F7V0vJPkfnOkwKZtp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5w+p+XWx0tWKr3u1OYBj4Acwy5x8uMNTWqQ2iLdzNeLNJNWqZ
	EHP4+UphVIhjMdmEFzmCWB4kPSN/NoJNPQKILFLG9PeNJx8Yw1sNhUn3RJyt63Urvg==
X-Gm-Gg: AfdE7ckoVl7G8wU8dN2+ZO0RoWgiDxIyi956fu97Zs2HLD/ckQdDjpoL9I8zSy50aHV
	jNonbWSihCJGB5SZW2Nuneo2WIUoL8S25btticYPgIj2b26f9B8s48kBH3TblHOHo2sFAYMPc39
	ywXQp+UqoFhpytudJADvwq8hY32ZFLExxC5+TWWzzIMxDVJ0eLqoNOssLhA/GRBeDbhB/Re39mn
	YgpJuqyU2dIrTwelCyd52sHv4ghtqOTh8RAfRaMOjftRMgTu9c5+1vgj8VzycQuE/NDa/w8GGvd
	60K9TfPZ3MAEKyJrfYHKUcfflvRUegl6HTGQl+KhR753W7lYzIT9DxIxhYjyh16feHryGLpSCbx
	xR2mTsySUFZA2r5W4nJg1p3MWEfZtif0pe+GDcu1ibXUb0yGL73Yg9eMvY9oVJe4LXmyp3KY3RB
	marHzk8cos34xWQ27QUTVDbOVtQmhZE7xdqiNKVJnDo6JF3wTnCCkBY+cmYxd4V4uQWw==
X-Received: by 2002:a17:906:9fca:b0:c15:ce72:9350 with SMTP id a640c23a62f3a-c16b47d8363mr98457266b.41.1784285181113;
        Fri, 17 Jul 2026 03:46:21 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (91.27.34.34.bc.googleusercontent.com. [34.34.27.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50bddsm56652966b.47.2026.07.17.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:46:20 -0700 (PDT)
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
Subject: [PATCH v2] usb: typec: ucsi: Correct teardown ordering in ucsi_init() error path
Date: Fri, 17 Jul 2026 10:46:14 +0000
Message-ID: <20260717104614.325250-1-akuchynski@chromium.org>
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
Reported-by: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/all/22064276-6c56-411a-9f20-6917ceeb865f@intel.com/
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in v2:
- Added Reported-by tag.

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

