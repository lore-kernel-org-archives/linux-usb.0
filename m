Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481759;
	b=HqfpVeWoI9dLq4RUDoVDEvpErnzIj/oSEhy9u2nAZuapn8zCOE/bD8JhBBIITb5o8lWN
	 PhBRvnvBP3tElAsyxWui/u2vnetJNZLYKfI67EPwcNDFbDOx8u/9Qfii4Ze4GM7e0E3Xe
	 fKP09MPTk4z99Rw7C1L+Gw15O5BKgxnbySOjFCB5QYw9L4Jjm2uZjXvXMhwsfmFw/25TM
	 CTLHMbsRY5jt0Sx/vGu4EkoG2HmPQD+B8w7D5nVWeNiK8cNox0rC1RONYXdJTU2l+SQto
	 AuSL1aOnhkSGYDNu60kqqT/yrOBgXvAfvZmnayAnk1b1w3+zjDw+ShT8C4WE1VYfbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
	b=UWRS7TtetqdGGizI5g6EYgZnkvcGqHibZXDzCZyiIjrn5aXsYDQBXEnGfvs45wtrlkb8
	 rx1AUkjTwlC1AcBOGRg6oMxKNbTTUCK12BA0RmJ/wbgA4peM72gwCQ8mIZ6BJhW3sCSSE
	 o5c3WL7vhpPNyfmAeSYc414b0UNBsJXRVapsx5itTFImT5Qch/rHVJP3v0CtkxGt0zfKB
	 OfZFVPyMEbFLbPyucKM1MqbBftuHF8DuDrJsqUjAblWdOvaF8utvE99uqZ2ILSRgRoFkM
	 T6hCEajTAfMSeBQCCAYLtKG83iqx9B1Q0rRHKra1Ad+xGajCcq2FK60aj4UurJYSFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aPArUoC3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17809606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17809606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aPArUoC3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922dbcee23so2419612f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794481757; x=1795086557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
        b=aPArUoC35fpsLAcHPQdPX3P0Aap6FebkY5PuLtTPbhXxSpJK7zmf0xsSZY7Vqvv1Uc
         ioxr61OHpPoQKjyx43F4AkAed5eFmu1aquJ0sKdW15uLP6uscwjEkVOH2S/AlUvl6ufz
         pdDmILORfObQH4eXpc6F25yDL7+fMDzax2NfVuMN+osprMP9nPIX+vSrNh2lVmn+huNM
         YeejSxuP2GWm0FzDlyoev3GIIIkMxlTk3AQQkmhnuRME05pFZistumRg4xDyvyJOzsKm
         QMczUK96g/Yj+8nK4ITqKjm3yQtfQftTj4iPvwvNL3PpedO7yI8+vcYPmkXH/tGXc6K/
         G/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481757; x=1795086557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IffUWbVgejcXQC3F+05E+VTrz5GzU4svg//3Rjb0ZF4=;
        b=XaJhBHRB4Gh8ptOk+RMRA3pKn4UYmrCbDX5hFuO6A37/TdoyChALfdgm5yZieflTp1
         ZSpDVoK8RiEmWENYId9Jgm49Cr9JtkXpoCFrgXH6f/VnScf5Jb0rnAChJXV7xhdFY9uR
         CFJLYP0QBcOxgDkL1m30GlFlPFEVDIO88UjRGGAlfLpDdRkHKi2IloAyXi9t0Y5pTdFW
         G0IZwPdfudwrfcQYlFq4p4dWmrl59Z1ITPWqm7xt7i6IWWRFqk5WbOHgza7lAjwILdh9
         Tl7UuKCJoYwJzLOABvI/XdzkDQEIqBySbNvmgsQ9Ag7qyf8fRkXHsiQ7URZ7Ck7ftTFP
         2gbg==
X-Forwarded-Encrypted: i=1; AL+hErEuRmV36JPN/GOb4BayvWaejE6aGv5ypEKCjT3Tc++LW5eHuHYbMWqcWnqYRH5U6/4fbi1V4hMPMc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++mkqNp5TMoP+akIZ99PgAtVUvWnu82w0NwmuUQmgDvyC8eb9G
	tCbtrs+8i8jkZWFNchF2bGZajaDRM5C+GwpqVzZW+1krAg956lLIrLs7JaWeFnCeYVw=
X-Gm-Gg: AYBFou0blTxs+RMY/aD/ZeydYx+LhiWHMPd0rq5DIkWzfWADD6+EJvzUCFJntFLWs7w
	X8oGMciiMrrnm+DqEjCfO6WocydeyzDdFUwXbu2iU4sORBRgQKcn4lcDrOsJ7FZWpAM4+qVYxjF
	Obw01sYgDMS6ahkjzKWdIYdkX9mSuSvn+7ZxuK6wtF9gjWEOk4uaK4NOad++m8bHPPJG/YVkkGZ
	3dUKUIOvYm64dtTpRp/iMsRVTu4hTzdt4VWvZqT8QYZQOzv0qjmw6/lnYFdenyRZJUI3rvGSD2P
	36xQXEu1PCZDOmr6Up5Qukk7O9Tm52UxbvnlgwuN8BxCPrLFveSe1ISCfG9CzoRk7H84e6q5n20
	+gAzwELneR4eDxXvZLcaXG1hOXj3IKK5kvSBS04RaOT2WM199s+NdLJVsfhIALcawi3ik2cJIsU
	e8x4RCzDBHTg26sB61v+wgVLZUqbzX0PeK7WZzyYIkx4BTx0o3Cp/DgsgUcbmoDyN/0rmCJpktX
	HswfE0vHKxCgeG2HpRhmDkUblRm/HSwtgzpXUR5/FUDmnDoluTi+8NRCqght4GcWCi75q97WJ25
	QcyI9L+d36RbpA3fIx3EU/Y25as4vBJeVHXgEe28GJIWQJVlPp/3byJb1WeDA9hkc2LXYA==
X-Received: by 2002:a05:6000:40db:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-499c717cc4fmr9080408f8f.15.1794481757574;
        Thu, 12 Nov 2026 03:09:17 -0800 (PST)
Received: from ?IPV6:2001:a61:1383:8501:b640:909:5395:1fbb? ([2001:a61:1383:8501:b640:909:5395:1fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm16041397f8f.0.2026.11.12.03.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:09:17 -0800 (PST)
Message-ID: <5d30ead9-8107-46ff-a29d-8646b941a79d@suse.com>
Date: Thu, 12 Nov 2026 12:09:16 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
To: netdev-bot+sinfo@kernel.org
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112104548.693456-1-oneukum@suse.com>
 <179448073312.2168702.13029326266334825765@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <179448073312.2168702.13029326266334825765@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.11.26 11:52, netdev-bot+sinfo@kernel.org wrote:
  
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.

This is in response to a patch by Myeonghung Pak, whose patch
tried to fix the issue, but failed to, as Sashiko found out.

	HTH
		Oliver

