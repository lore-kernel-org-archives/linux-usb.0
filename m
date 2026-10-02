Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982C33374F
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929953; cv=none; b=UCS8vN9g8DXIpoBZboqyyzydVg79QEvXvIH+Kt+rk2M8qm/sK8bMPNN1snbUYkv8WUr+B/4Jk3X4ZX/Ejf4omWvqw4IJAhbCBtH1zXz0B9tsjtu8sXvy+5cxkrPtNaXKeNGfZ4eI3ucGu/VypJW2iSJ8r9o+iPJ7CnpakJj8Vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929953; c=relaxed/simple;
	bh=zF76oz4WZP/X06K0KuuyliwnKkh6eH6J1UrreBkUc1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QfMs6HuwJ/rNpjMYZML09ZI/RIXtyP1mNw527g/C3qWT/362KOtSxdsg+ynMMqfdO7eQfIBYORzHTkCy2SMfRw4ZlW6qpCViAh2lGwwM7rcwEbWOxR7GQPJUnNQE/ug54888OBL+opVIO7ZY00V7o8MVX3AH2KvsRaoZip8Ze08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VhAXFi8a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VhAXFi8a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso46617445e9.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790929946; x=1791534746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ys5uWke9XBV3Ke8D3pwy0Lwn7XKjGlruZIy2p0X3uuk=;
        b=VhAXFi8ambzYBv9n69bMkNca7/NJ7sPb3NrTSVe8FVSpIht92qKmRTWr3tjSBTgiAa
         WEsXt8TnPQBCeLDTFhaciL/1AhWWGFe6ayK+7SOSdDRNa/PzqYvvcXpbwZ2l4Rg7sYLW
         ub83ANUrqJxByICIMfe9EvytuOhHA7VsAHZ970gA82BMzNqXu09AOys9CXWQMAA5dZt4
         D+MMNz9D23iBMBb7o9+YtCcjJOuH28IpKRGX/lgKEHdnz/oe0G4+7ETkTNoBGkf2yw72
         I4+J8aQXuY5lvnMaFAvK11UlQoSh8GupOYg1ItqU4LvGv+OdWKtV7Qo5NOt7M7nrF7Xj
         EzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929946; x=1791534746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys5uWke9XBV3Ke8D3pwy0Lwn7XKjGlruZIy2p0X3uuk=;
        b=UkC2m4y062rCNbfClNCl7kmiXah4ggpJUWeFCRzt4O38HIoitg+3+VKhsr/xCAIbn1
         6X80GdDr9vr2vNtPz6pbzkKOhoxYqz5otkm30H/azxdymtS26h5RltMwSqvxbKSkwMbc
         sXcc1vyFSUrhPdinh16EsTovmGCUO2BhqvXUwwa4WCqguBriwsnznDHR9TXip2RPqmoY
         iu8wR6Y38K2pk4qiiixa7kejWF9fPobCnbWFhZUgWFjkCth3o5vY4dRT/sJ9v+mMGfFk
         68YTa/bf9cGsJoTrqLG3HJWYYvIDKrLDjZiKSXeiDaMEsdf0zRDBtFVtyfw+BKY55LCL
         OruA==
X-Forwarded-Encrypted: i=1; AKwUvBwwA7CGrOVEQ2xuDSiKBx5xA3oOeaNoPOz/g3gnrnvKq/6LXcgJqahGjQWxWCsxUkAQrK6ga6Wa9IM=@vger.kernel.org
X-Gm-Message-State: AFuF++lNwkXpNmaYsz4r3icaFfcxcMIKGVk7Em1mzKkL6DTeC2rWFJGJ
	9N7xKXgA6IkRSGYQ2jsk2nXl5vuckIOl/dABAwC0QNre+X+BNDGM4SN10vhc2/8nhSM=
X-Gm-Gg: AYBFou1mHX/VsRztKJNc6KItZqNWCXSoi/k68rBZNwDxrycCha0B+kSOqH7svAvYDKy
	w2B7NXasFg1CmHBcqbI5TfW3so2830TsnIBYabV1cZTTCXgTbdCYBFdAYXBefwOT9D4sx0t3vVk
	RWR+UdbbEM7OVCuywI/QPTd1jJwv1mx32KqH+u94rH84ExdZDyDaDGgieOZi7GGNNy4T1wB6T0h
	HBlZGlFd0MqZ8xZ2zHepgxfmG50BGL146D0uAwr7eJw3CuB/ExmUJZsM1qIh39anMjjjqYuziPd
	UOoAfOznZYiX+yoN6rwOX+3IzvYHdG/Ee51ehQKvVPC3UMpBBLTnAj/bzJjQIiRc26NiFRAVVyr
	jQdItPH1bPxYbBsA7gjKY/EXVdxUhZH4VOWJY/NsBEI5YwJAzuYARZ1opSrvpfzzYKPnn2FWrxh
	+r66N3gX/pEJLrNObA5sJ1eCWOHOCwFvgb3Oz+4MqGDoD4ty0epi/upomyIYMDgETR7eQ=
X-Received: by 2002:a05:600c:4307:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a0274569f9mr25694905e9.0.1790929945843;
        Fri, 02 Oct 2026 01:32:25 -0700 (PDT)
Received: from zovi.suse.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm42507905e9.4.2026.10.02.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:25 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rudolf Marek <r.marek@assembler.cz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Duncan Sands <duncan.sands@free.fr>,
	Chas Williams <3chas3@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] module: Remove obsolete __MODULE_STRING()
Date: Fri,  2 Oct 2026 10:31:03 +0200
Message-ID: <20261002-module-string-v2-3-fc7438acaf4d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

__MODULE_STRING() has been an alias for __stringify() since "[PATCH]
MODULE_PARM support for older modules" [1] in 2002-12. That change also
moved it to the graveyard section at the end of linux/module.h

Remove __MODULE_STRING() now that all remaining uses have been replaced
directly with __stringify().

Link: https://git.kernel.org/tglx/history/c/136839a1b4 [1]
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index f6f90cd88f15..37de77340032 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -896,10 +896,6 @@ extern const struct kobj_type module_ktype;
 
 #define symbol_request(x) try_then_request_module(symbol_get(x), "symbol:" #x)
 
-/* BELOW HERE ALL THESE ARE OBSOLETE AND WILL VANISH */
-
-#define __MODULE_STRING(x) __stringify(x)
-
 #ifdef CONFIG_GENERIC_BUG
 void module_bug_finalize(const Elf_Ehdr *, const Elf_Shdr *,
 			 struct module *);

-- 
2.55.0
