Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CDC3F88BA
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484032; cv=none; b=ei3zgThixx+80XzSUqDA2rywF2bglpUd7575bMmdMjSq3TBVV5Bavo+Xvw/1RdtmxKLtJmaqBGtVgM6pftnwld2jTMcPvpCu2UdqKwBTkce0WePe6HzxkSrsePEId0Pl8b4EqACuXo8+GVXveLcOCmAa1EKjODbhnj0bfMRg/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484032; c=relaxed/simple;
	bh=e7W7XK+si28LPdcTi/yKM+HfuhRf04velbB6bmBCDEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYW75w9csiUOZaHfmwUBsRvnr9YxYkp7C/x2K0U5Md3835DKJQdou4RwnLBsdGJL1YcshVWy5Mk8AQp+gUSMAajo36nDtZb0LwkE874AQCt9QmIZTFpznQmMYcp2RZ9pWl2z3xwAjXMWACxfTwDlOeGdr32nmTLkrzJkehNetGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ipJAteeK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ipJAteeK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so1906549a12.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782484026; x=1783088826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMJRii6zV79IzIpWO4mvAa5Wtzk+HYUJ+L7a7vjxsXc=;
        b=ipJAteeKDx7dc2q6lX+tVOmDpeGQX/Ve0W3zxTUVulhzpIT5/an/gLEaZHSyol+YQm
         JiNt1Fxul4uX1cnnPD1Nt5AA8J5GWrBjfU1iR1ImulJRSTrefvaaJpUA5hXePQVr5az/
         XVxt+R9Y+cdR8PaY6WlM5hPZr39j06FpKWlHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484026; x=1783088826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMJRii6zV79IzIpWO4mvAa5Wtzk+HYUJ+L7a7vjxsXc=;
        b=GuEpLvIg9iwh8Pfeb+7Thze5TvIu4FJjg8YF3VW84k0own5NWt9KhyTuo/Zo5EVfPt
         5dsF3G+D50+HpEN1w/DcBhNilYaShuZWhU2oi6gb3XITghp3Ezu/8hgYxUeg82gJ0rk4
         n/FOF6HMZGwwZBILOxW+rTW6ZeF65OJYn5nkqrryUA81TgnakBVH7Wlu6g67enotTRCP
         jHnDLQmCGC0Ivc/Mz/yKut6UStuuA8b4rryJYXFQF8XhF8xeLPmJMPleQJTGn31HM8yP
         6lrvgOa0aloujThTjIYxI+e6xWLgiN+W0lC8iA3k0E+tc5e30l8vQlrDynfxk44AdzvH
         YuZA==
X-Forwarded-Encrypted: i=1; AHgh+RoBMqjxxfSyc5QIYCXw2F+fWFwYPGxnhu9hr6PfEjq3Ya7TVEONugrVNaq2kDWynbnjLP/zeqaN3S4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykWUynfEsUELBHN/WzSyKGINFXm2LaAZfs+WHGHpC3Zmjls0Um
	JmJEX9Tn3V1fvCgULV3sG3lJOzojBbNkaj5jmir4VXdPkzq+CfUzg3m4NN47Eco9XQ==
X-Gm-Gg: AfdE7cmW3B9i0HwipS1DhCBTM5cGtY3uXj2T0tXTNir9bWy2SPzvjlZfIVDrL4wNVzr
	GkW+R/5VtcbsIFpj0TZOCwlm1N0KkcV3YA5TvEVkp8n7RVhgZyw643kNcs0aspDO7Op5Dyf01tl
	ayUIuO5DKYT8dzsGBAjJEn+MAdP/lySacBy/Ay5LPXUQ3Ax1Q3kU+hANsJM8L3DnNMLt5g7so89
	hSSxu/B6ja+o9D2YruDEFIDBRlhX6Nm7KtJgAyy9+Xjz8cSAuRL+QmJQcZ32dRPLZpcBbmmkeHw
	3lQX5Z7jJjgLKGes7m3BDELwEWigtgXFVv9s2QFaTSKQAq+AA/R/ZQ7AtqAKKuwOW33DbfGHcOn
	P3B/Is3nTMti43/hKGUNDBtNq4BDN0fRk3XS5SW/nyDqaUWRaB+w3D+RVRHNcYuYZ40iG1ike64
	24ny9hNzJeTV8An5m7wA2YR51cUGcKaw5zV7dICA/+5G5sJw4hAs1nZF56RNBwrxuLPm8F7YJMl
	zkO2XcYdQ==
X-Received: by 2002:a17:907:e143:b0:c12:b32:5651 with SMTP id a640c23a62f3a-c120b3256cemr244716366b.13.1782484026489;
        Fri, 26 Jun 2026 07:27:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba6787sm355968666b.6.2026.06.26.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:27:06 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 0/3] Restrict alternate modes based on cable capabilities
Date: Fri, 26 Jun 2026 14:26:59 +0000
Message-ID: <20260626142702.1941182-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, alternate mode drivers (like DisplayPort and Thunderbolt)
automatically assign operational callbacks (`typec_altmode_set_ops`)
during probing, even if the underlying cable capabilities cannot support
them. This can lead to incorrectly advertised state configurations or
initialization failures later on.

The first patch introduces the core helper function, and the subsequent
patches update the DisplayPort and Thunderbolt altmode drivers to
utilize this check during their respective probe phases.

Changes in v3:
- Extracted core verification logic into a static helper function
- Added an enum to handle supported, unsupported, and unknown cable states
- Patches 2 and 3 remain unchanged from the previous version.

Changes in v2:
- Updated patch 1/3 to use a switch-case statement, added detailed inline
  comments, and separated the non-e-marked cable validation logic.
- Patches 2 and 3 remain unchanged from the previous version.

Andrei Kuchynski (3):
  usb: typec: Add helper to check cable altmode support
  usb: typec: thunderbolt: Check cable altmode support
  usb: typec: displayport: Check cable altmode support

 drivers/usb/typec/altmodes/displayport.c |  5 +-
 drivers/usb/typec/altmodes/thunderbolt.c |  4 ++
 drivers/usb/typec/class.c                | 71 ++++++++++++++++++++++++
 include/linux/usb/typec.h                |  1 +
 4 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

