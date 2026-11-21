Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271519;
	b=SJ4+58GgQc+3fukGrKeF1VCfBN1g3pUgRbj3dDKLEQmlClqfzgHfKlot+c6krFIj6bhv
	 TZP5VJRCpfN4AmGEyK8Z6hvmI0hhPzxZnqS6AmGvPqka+Lo5du5iiKaKPLtLVcEhilJ9q
	 ow6R6rA+Q5MXO7O+LL/TC4VGj/awjDdq6JfXVkJps8oXa7T7FO6HuGvmDt0nbu44o3OrH
	 ZQ0c+rQAbuBZR7osSu8PhtyU4k45AINW9wtsOhyB3nAUK42PezHvZLe0XMn2cxeyvqmoc
	 K92R5TK3gnR75rjajQlyRRP/g0tDUdjn96fSvmj4gw111ujl3L1rxrEFHfiqg2Sut3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
	b=ZWbSAQ7UlvdJ+ERqZFgHebVjpp9OqELXfDqUw5FooDmQbcFR7fWlAGrQO2eHDBCGvYpr
	 BbF1KGN0aLYTXaJ8Y2/Pm3vqWBCJliz0iYo7lDOfCmvFMAHiMIvqKCbDALYg6SoaF2atR
	 xxv+dm1EJSoMm7PJzWrtnDT7HzZW8GzOhN9GV68eUvUJTknoiNMUV7jsSWF7Qa/xUxhsF
	 jCusY5KfXrxdzuxPs2UTFShZQXHX2ykyVOLYx1uMlaA4W0pxfz62kDwpNwtFvbR0WglXu
	 ATvLw1kmqlupbDlWBtL8bGGoNresww2rLhQGGbmut24cP1TKUxOOwu9UC2tumWqlq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6BEUhs;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EC606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6BEUhs
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3ada81853so2098907c88.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271518; x=1795876318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
        b=XJ6BEUhsj4hodvd/X18RQqjfEaNp8QOypzGFE6oXtI2Ve5SmHA+JDuWv5KfUwPglW4
         QRIIZuxfyCiRyS1dkFG7mzii0v5OLlhBaEPsEstaTvJnEg5tQkA8xgW4lgyqEEahCxc6
         hylrUQQ3+atT6Tx+8u8RW3+/rWPYd2XwEUHtWAUW6rWPONWmlNXm5YzUkX+vrLcfaxrU
         TEGfKaQ6Yr94SFWeIOFK9GlnyfR8Jz7BqmWzXbFA6S2QP9MqM6GAcxP3mwM+cbNIrEww
         mwFsJ97absvKsJT+KluSdQfkIyQzIZIfU0g7C2PI4HhGD5nUaTEouDTQ/T++5p6Ru6Jh
         yWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271518; x=1795876318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
        b=E2GKuqNY8m+J6AL5hyWnzwjaEBNcirWGZq+ZZGPwOWysFaAGlI4kxvC68gF9T+jXg6
         3RpaERlPR31y3xh7SXFngFSKYIhKugbuLwIIdAntUy7No16HzbNZ1BdPPV+U3Dalg50Z
         6m6cHbAXeln2Te6Q7kWGVWv9q8gHJQ/ji4SQfPVEWzWn8HbuRaOG3bSssyQldvx9zXaO
         QdqzjFN+OedMU2zr9O/IPRI74z2lXhPPuGCxNkWwEdEbZn9X3v6JF6PNnQeJvgld8t7j
         v4VlWowFwLTHrjT6LIUiC8Fx6smTgpJq4rGbucrMINg9P1eSIS0q8owKiw2GVtbqJVCn
         iLHQ==
X-Forwarded-Encrypted: i=1; AL+hErHEk/MtmkP8TSD9d0tGRrROIjjwkfxXQnb9M4/ixK7SHyWmHX2UvcZUOWUdgApzsvJH7rUKmN3oVaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/wLUGzOJ5J4W2NhH4AZB/5wwyVhjqhQNYnck4V+Ei1dL/+vc
	iyi0c4cw+9txUI8hHl+HYkEetL9QvnfdpjL5vlaGMKMsg8pWqameKATG
X-Gm-Gg: AZFdTZc/YvwOcZAtB6YDbnkvuBtJND2Fq4gns7Yx5a9RZ5AFFgI10CzKkfhfJw3Aj1M
	J5ga67XfnKZGHHZQOt5wQPx3qTVT8QFCIoZV+YhB+H78WPSm54SRgFL2oiD1QhR7wlEPW/kATni
	z1uKxh2s0oUhtZ8hdHOdO6K0sqAd+585cC66eqSg3ElUTKO3Ga5U+W6uuIx7mcYlcDtWawyqbhl
	e88KfgaBr/UxttMfEs9K62gQ5qJW33jcuKVcFCnzS6iFwUQvM76ioNTs8KxMTOMDP1NVAWJ9uis
	CtpQGbeM+DddlwVMNNxfxpq3MdRwoe+23w9qsD2PEohKz543+CGxWzPRhm7mjwNM/Krn98n45kZ
	EJbuDTIpsDswJimBIJvKWor4DPIrN0mcDwTO/OhI0haSsVSkRxxO2324+ZJ+xLUTyUo1B3nJzdJ
	sYKW7jedmM58KzCcvBdEJ/6TC1KCQpo0DUc7xyTJIqqfhO/Lrw4u30W1AFECTVzmRAalR0EAIVr
	7qKUf6GyvGGiMbXL4cwAGnHTv4ZDgfolK4HSCjX7KLnHxAuspi7Ts58JVgxhsxdsuUa1yGMO5w8
	oz1zs0WRLEDGWG1/mhY68POVP3zzvc1PIjG5DROB2bGGoDT2fqMHbSq9gx05IdUK+lW6Zw3nIpJ
	/FVE+LgCh2FEpgGJwTai4cbNDGrymvLaUG7JVbZCThr+0naMEz6h0fjdJVUdXmP2MJC7uUciAdM
	/M
X-Received: by 2002:a05:7022:ea26:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5568aa9admr7108376c88.22.1795271517739;
        Sat, 21 Nov 2026 06:31:57 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3915:1a85:6d5a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm14658015c88.8.2026.11.21.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:31:57 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	pavel.hofman@ivitera.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: u_audio: reject srate request for unconfigured direction
Date: Sat, 21 Nov 2026 20:01:42 +0530
Message-ID: <20261121143142.17721-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u_audio_get_playback_srate() unconditionally locks and reads
uac->p_prm.lock/srate, but g_audio_setup() only initializes
p_prm.lock when p_chmask is set. On a UAC2 instance configured
without a playback direction, this results in acquiring a
never spin_lock_init()'d lock when a GET_CUR sample rate
request targets playback, triggering a lockdep "trying to
register non-static key" warning.

Reject the request with -EOPNOTSUPP when p_chmask is not set,
before touching prm->lock.

Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
Assisted-by: LLM
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2: Add Assisted-by tag (requested by Greg KH)
---
 drivers/usb/gadget/function/u_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e53f2927b539..ff811ea1e25a 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val)
 	struct uac_rtd_params *prm;
 	unsigned long flags;
 
+	if (!audio_dev->params.p_chmask)
+		return -EOPNOTSUPP;
+
 	prm = &uac->p_prm;
 	spin_lock_irqsave(&prm->lock, flags);
 	*val = prm->srate;
-- 
2.43.0

