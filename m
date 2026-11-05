Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917168;
	b=TbTVbI2A2j4EVsx/+WMWqfwuIE/P+su6Jr7WIfkxzdqWFGaQRaVwWgJ8Sx6Kg5CYp3Cz
	 20sVMubbFLyjPzyhMrLoU0y1BEuoVkk/vIS2ij2gJLN21Xt0Gwq4rQQtTrrSFVJGJe42A
	 QyUmGBvMx7xGF/0mLofErjYpnhR7rlCPb9I0ptJjUSS6vJBfkMXp33ZbrYV+rhZI1LfTm
	 sd9cMqSaLDNQB3c2w6u+GVvwttDB2g3V3lXOhAEBLvu7kaURuaTbdppeL0yBC29A0x5na
	 JiWLGA7bt75BRaWCFxaDrtR4r8QbhOzcd8Cmxg1dIhGn30rm85Hjv1vTeLt/g5Y9R4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=79DpqS5v9oMecI2JJxzjWdV0Coqxm01u7qcTGTvQltE=;
	b=pgPsyZTH75IympsjPdqzsAnTBK//wgQQm2gE7C/CUTmWhg5/I3pWw7Oox00JcQhAQ3e3
	 2RKSYZXaaLutBvr6xaxxV04h57FgX9OtXxREo7RnySaJSJh8vWWOjjQcx/rBMGUzvwzZ/
	 njNtk5hSQ6TryhSNT4wXjCMKziXMZw7tAY947q2oU5zu9cSRs9HjQetDhu9uY3hCTO4ey
	 z8Y1jpdjIfyNxZLoCK8uSPSQk7rZ0iarYqIORqt6v62nBD2jTQ7nghaLYVaMfSCtgry+6
	 XuM3A1a5BL1RYlSRmo292L4PTmf98ZVAj7OyFBoNb6xtnBF/A/GjtyMSHSaw+8OsFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QRAmf4iF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206E606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 22:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4206E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QRAmf4iF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b35bso40616f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 14:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793917166; x=1794521966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79DpqS5v9oMecI2JJxzjWdV0Coqxm01u7qcTGTvQltE=;
        b=QRAmf4iFA6y9ZXRgCl6G6qnMymq23SmE8SHWuslt7yTLSjQgpaq9cX4jbDBMs1Pryv
         kVx2xNP5iJ5mELqOhSl7EDUhfo00OQe/NjYMXHoxAhpQH1nU5LHvlk6v0oWhI1Nw9f5F
         G7UpqOtz3ErnF7Y/Gs5YcRlt++oiOUjiiPhDWCJA8vptw/WlAZiJmnBmY4f9H1qmMDzp
         OxwwEXIFIIKa2SC5t6rLvZGWy0aHBln2jF3ll+S6Yc2L5QUZcdL59qvBTR/q6ZVebY82
         BQCs4y4HsoWflYKLJpnRBsqskdnzG++0rca/6l5vvS+CHVGaiYz3WirFfRny9qxxRENk
         02XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917166; x=1794521966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=79DpqS5v9oMecI2JJxzjWdV0Coqxm01u7qcTGTvQltE=;
        b=oT/c9PU6FIwEyKPvsY7ieQz6UM066ricY7rBFxemnHpV4oCXFjMRkINnY6r+a0TwRm
         B2z/LQP+VNmL2866+IevJCh3znJUDNrGjFJmOh9keoH3kJApyrGzTfAXY9LszRmZzBSV
         gJ+qSSebQXB5nzEP9TpPx5RPXReZECaQFjRFwFrz3LyqDWHosVIFUXbl2+O8imA5yzaJ
         uRlO6PBkhpBq26/qOViiriwG4oOsnKL8kHh2WhOgO4TiZvtIPWMRJ/7leb14sNFxe/oQ
         JJk8zxrNnPC9EHw9F9mDr4/MDqiP/oOois3yzIX41FfypuhJFSkA4Y/pwthvsvAa+G7O
         WRPA==
X-Forwarded-Encrypted: i=1; AKwUvBxh1nO5c1euza7BdqnBpvdxxqapANEuhdXGfaiCcA8fwbHXwROU/y5e6GHCPVKxBOur/4MN7rs4s4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l0GVKFURK+8CdqxwmTtC7frBQMXqQNfUhWOgNun9hWVMBKqh1
	Wj7yG1xpg3Kqra94knMBb8YmbfLx45m4j+AjNmL9YSeJBPum4jVFSfUuCZ+8G4J2Xnw=
X-Gm-Gg: AYBFou01kbnsFgdjFV48eIvZ+mKvpYCHv7NxZe/tTLjn04WDZhlphH46oK9ZjZvUXME
	tmaeallnaLDRsoBAP3kgGYYGndgPsTRth9JGgMEQ4JMgFQeO2hATA1aVZpoZ87q8733Pq1etAMd
	dCRnvHnN00NAVyaCaKA9p8rO5vOKMLMUNSRD2f88rKax90lzIfWq5654tC+1bO4h2+jcytXcr6J
	XaS61fyhY90eKQkYxijFlyvlYs65Hr+X3gdWia6olB3EL7OAfBQYqlwiLs8gVAv8JRdZ1AsFnmQ
	WXFM5ItgBVhY7SmTI05tbZC018jhTcWtv5PeyTQXvlvMv27Grx8vkITXav+t+lu02dPSlNY8OyH
	IbWou3YMPwL8KZtTEZmr/iwxCr+hMXkDFdBC/j1zXi7cSy2wnAE8zVZuzwe0x4+qNtquZjXGkCR
	WrW+uyBR8nDypdFySK9gBgKrLyiA2XW97NbbnuCBi9bvUfooe0vlok6lz4z8zkgCzyPfW3s5bqA
	Diz2HKTTVgeYLEw8tolyM+3Yb6BRLpTzDPKyD56aabVr9KcU8OYJpnpXP0v3MQF4m1IbnmAN+J7
	PeJnM0TsvLRA4PGuVUC6GsIFy7/tDrVFCt3F7NdfgKrpYbpAQwGCRMEj/Sf+KA==
X-Received: by 2002:a05:600c:8712:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b6df7d4a3dmr7175685e9.20.1793917166623;
        Thu, 05 Nov 2026 14:19:26 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609bcsm57071f8f.5.2026.11.05.14.19.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 14:19:26 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: gadget: Restart the gadget when a new session follows a session end
Date: Thu,  5 Nov 2026 23:18:10 +0100
Message-ID: <20261105221810.89921-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <auvJvr3oFWhB2SeR@vbox>
References: <20261023091832.6765-1-olivier@mgcrea.io> <auvJvr3oFWhB2SeR@vbox>
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

Hi Thinh,

Please drop this patch. I went back to the board for the bot's case,
and the failure the patch fixes no longer happens there.

On the HiBy R1 (X1600, power_down none, gadget clock gating on), an
unplug never reaches the session end path now. The data lines break
before VBUS, so the core first sees an idle bus, takes it as a suspend
and enters clock gating, and while gated it reports neither the session
end nor the replug's session request. The replug then enumerates
through the USB reset path. That was 11 unplugs out of 11, with the
host awake or asleep, 6 of them without this patch, and no
"failed queue (-11)".

So neither the restart nor the sequence the bot describes is reached
here. I have a v2 that notes L3 before the handler exits partial power
down or clock gating, but I can't exercise that path on this board, so
I won't send it without a reproducer.

Sorry for the noise,
Olivier
