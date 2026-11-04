Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785819;
	b=VV3Cbbl1n7MDAWV2/ZWQVlZEzhXPTcSv3wjdH7F3yZ8qTI4pQ1E8Q9NM3F5YyaRBBv8U
	 /JH3DdAkblGWCK0pIPc2WFnFy6y76xLQ6esHHHTuZxL/kYim3M7XxXMd5kxj+ga5D/llg
	 yi25spwtm2MZpeCph0/szwiuccmVGLNPIIWtSivyirMEoAJyKRuSy+2oCnssVVsSAUQfU
	 3uy4j8G+mzuCoH5//y67bzrU3XCX5XTB4KheyvpXxgU3kzB/hRyW2azfxfSSZp/n+fGsy
	 MblfBbtIQUkMsilxqxb1/WB4OWvrn8LPJicpt7WZ3vm97AVwixb/6w1PUrLrN0N+4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
	b=kdR9qVbBpJvl4MIDAkrkZo7bqY4LaVZMOwSNH5eLQ/p6K6FHrHGhDBkkXbCwtizQa7G2
	 77rIqsaozMFf0ITJgbfheV9oPNCFHK8Dokuju8cjegeV3jpdRYkuI1XTiPvmeA7I2OL5j
	 TOJIWB4Cla6p86pYv+ZbQpsHAzUlMMqnXGgHsLHBFgPdUmbvaYlZc9brJd3EsTY1bkh8A
	 1Cwzjzz1hR8hnim1vqZNvWQRtR8ued9ExgIWu7wGGUfWt6HxZFmmoSg3t5SPr0GvuKlBx
	 LEz5r3H+x8cZ1ppb0ET9Tx8iNNE40DJ/gyhTvd5E/75OYVFzD7pUuLypBe+h+hzvfYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwIumg0b;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC7606A32D
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EC7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwIumg0b
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so4814565e9.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785818; x=1794390618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
        b=OwIumg0bVI4/nRLmEpLs2ml90PPkrBN9/Y2ceEVRe9kieCjuJVzBse32J5reKiuvXI
         /wmlo68bF0Bh8oyS3KtQPkFvprWAeMVEJ0KQiLoAnAuiBLhLiWwgQJdf52rbxnmOaHIi
         N1GBjZANpLAUAUFsA7jAHHHQjKdXUWOXwmdgGHMMHOZAlkRw3vcZBNvAF4LSwSoLA1FO
         RxHSI6+GSLCqwZoVtCxhcabvBR32mcMwM98sXlV+RL11S2hc+qvhwz3T94DibaVOIJJE
         NwEUxYl6ewX/GhaFrVXOcmwD9TJqkFUGI1YrkutYDiA6LZ3E2PsaRIgNNEM4jg0dZDKK
         uAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785818; x=1794390618;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9f+Vk55viv3NpwRqRsDkuFkLcfNYRqwWUiHAW6XHcE=;
        b=S23fC0FPbru3mUgZ2b3vsAiRiUg857Wvg5j1FHFInfS9YYOr69ZmjVK5Otd5cm7bsJ
         TXZjOth6GTM58LPYZW2K0tXOkTEyN8yI6uwQ//qxG8Y/E+ccUKwDI+mGtfilnpdB4iIj
         +2NKg8nnnpzpwoDQt6nFYqGHqFsp3HVwQ9RZWin2ijyABfokiVijvS7ISoXUWrvrZRm2
         1/isBN9p2pXJMOEWRX+/jRwKtFqy7hg4ajJ64j8qgWrI/rFhIF6SaqB3gVQ2fGZyZbHo
         XwdDvtIgYwYsbGR96jCEjV0uTXb8yDGwSIM7eNS7RnMbEFpemzKXB1ATQjxlphrnA33r
         KQLg==
X-Forwarded-Encrypted: i=1; AKwUvBzb0IT+fIC1TINAToz0SqFpS2NaqHYSaH7ldDRcTmLkuF90Zr2vX14W2BmA7YVOglTPRDvlYkMsxCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z97HkowPRJ29aacjbZqpFrgzXhA3W6elPB5z80XtlMjMSq1vus5
	1L+5RTE4E/kkewRtwsFElFSpekrHihux6XKhXh4rVKBg+nG5nuCPdEzS
X-Gm-Gg: AYBFou3PJUPoxYE+laiND8ODZ71poaSoxcAd722wOe0raHqr152TshQ3odpulPMmZ/R
	kEppSKRh0vAoOjIHFzxlwelojA+nEkD/Maa7FYqXHpokICVK8zgXzKYbIlAiqhcDoybjdW6/cVE
	TffldobwJQNVluW5h1O6CYEnZhkMJw9S0mWjhu5PbjwEtqs7KssOp7GpcLp0+bsZ+LFkqUvtSBI
	7yKOu0Ob9ir+ovXrg0xAPbewbrfFsn0owyyqGfziEBR4gFvdBPIykGXkauSL98V954wIElbzlFV
	rGk2LakTL4wLa41UVBNG+e0nZOlIk6usLkBXjuum/Cg/uz33F4+TH0Jan+tNe1dIAZNUXBwfVf4
	DcWj0DBWvib1CZKiomttEn4kRCDYloUqSb8kHuVFn13dgAko9gz+j6ooEGksKoyP0BUNu8xwLy3
	CQ+pZ1+qqPnzH2VO4AlT/4RutnM0w/ecEWEpd6VMSNclJ+CdZRWHHr0ycGNiDIGqZSLkRLsoEKn
	f308ZfZoTAGEfXLrInuEtSw4iVfFHwaccszMc2hY1WtVu9m+gaMwKZvAfFfhJyFKm/coNVdJ3Pu
	LTjy8oVmffuGe9zqkMZguSq7nPPbbqlZxsZpgVc=
X-Received: by 2002:a05:6000:4212:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-48e6e4f69c7mr35846762f8f.57.1793785817529;
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8748sm2917388f8f.16.2026.11.04.01.50.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:03 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ambareesh Balaji <ambareeshbalaji@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR
 Dequeue timeout
Message-ID: <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
In-Reply-To: <20261104093608.2642748-1-ambareeshbalaji@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
	<20261104101506.5ae19157.michal.pecio@gmail.com>
	<20261104093608.2642748-1-ambareeshbalaji@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 09:36:08 +0000, Ambareesh Balaji wrote:
> 2) One real hang with the same symptom on the same controller type
> (kernel 7.3.1, tainted by out-of-tree DKMS modules). After a Focusrite
> Scarlett Solo logged "USB disconnect", usb_hub_wq stayed in D state
> for over 4 minutes in usb_kill_urb(), called from
> scarlett2_private_free() on the disconnect path. Nothing recovered it
> and only a reboot helped. There was no "xHCI host not responding to
> stop endpoint command" in the log.
> 
> Reset Endpoint and Set TR Dequeue Pointer timeouts are only reported
> through xhci_dbg(), so the missing message does not rule them out,
> but it does not confirm them either. I see USB audio hangs like this
> once or twice a month. I have enabled xHCI dynamic debug and tracing
> and will send what I capture if it happens again.

If this happens on real HW then it's a different thing. Having logs
of this anomaly would surely help untangling what happens there.

Were you seeing these issues before 7.3? That release made changes to
the handling of URBs on disconnected devices, which caused some people
problems even in absence of host controller bugs.

Regards,
Michal
