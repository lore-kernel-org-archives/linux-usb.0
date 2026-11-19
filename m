Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089730;
	b=LjTDuXRY70uxAY34pBw7JulDu4YwXATIWTKwCzW/WpCQ6d1hn3QF1qXbFBKxqQIGumWV
	 ouD/Eq8y29eVwMagvzerwTlcI7rP4GbrANUn0GsBYICmPtOLOKv42k7q4dDoBtrUp9HTZ
	 2NLA7qnUwkLYh8KiuSULvP11sy1AYEMJEmieojw1CKSvHbOJiep8twJT5ZBJtwo457vEy
	 +oaII2HUKMYtvMIl8MARV+7tedTsJFeMPO12UJs55tHn9//XmdgM4HZNJM66WBeQ9v3wG
	 C+SuWUIgixinkLZvzD/GNCRw+cBIeC+7CVJQrZU7opSAnVOf9ODFBMyMBIbEezxcGhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YDlJsIuJa8MwyVI77eR0NYxBTdSV7whURuYWldxSt9A=;
	b=GnMsPuyt9vz4/Pd4Bm73OxyYi/knakotsNOwbvvW/+e691zRlnPthsQZILYnmTa1ajAe
	 CehbNFn8D0sUnGFNkgXs4I8EJ0s3ZEdKouCNUUVpMpUa0la8Zz/gTX7r5JjkzC3EBpoRj
	 fTpAzYnvxYAKmr04e8aQjH0BL2dmnky7gPLicSMgXKGuzcdNkk6ubOi7UlXH0CeOSZjRH
	 Pz4IfOQbhclEYE2cFeMmBJhNR7L1wB1kqBc9gR9jpBSYB/AAHRBKsAz8irv/2ImpELQHv
	 VXNRXKB2yiBvLPNzM5iw/EPVpIHZTB0IEVgx1IR1GdM08+jXUgtkKUUpr84ZzSqqrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eb0C3IE7;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D1606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Eb0C3IE7
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5123794038so183836266b.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795089728; x=1795694528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDlJsIuJa8MwyVI77eR0NYxBTdSV7whURuYWldxSt9A=;
        b=Eb0C3IE7Of1VIKzNdNSGAOURqf8msysubyZ4D3mUOKBa21Nte6ajs+0hjfqUo3HK49
         353mGW2WAtSElXUQfEidnbvMCjNgjo+DInnv5D0d408r61rtefnWre427aq3+0wcbaq8
         uXbPV1GqCFuSxqu8iPFJfsOFefSPhdWmc3Kr5KKPqVXMJDxEsr0DwSaaNupN1OJolglO
         /JwS/ts6UZ/zBjB4Gu7YplVzylCT7MAUB9YB0FOEU+EWA7O/F4sWItKxI/5xQxWOwOkk
         ssQd2ldyicJJTHX6n4av0B4bkuEvPJ3vfIi0o80rvw16+kFi9rC7+zIGA0S26Xuz+7Ps
         Rz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089728; x=1795694528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDlJsIuJa8MwyVI77eR0NYxBTdSV7whURuYWldxSt9A=;
        b=JT9ll2j/X2up/n9/Ct3CzRuV4K/je5zCsxvzIGLQdlpM24gNOgGTKMPfnDMgCsM6eA
         9bDxEQEnwdPFlA/ODyHC3X4ve1PeJ9M3r9Ro+UUNN7GyJ4QY/kSW2mOibnkAuoIU8pET
         5i5T5ndnSyqb3+wmut6XiJopXF/EAiLJUI7lEqGDQ057AowD3+nccAAH7+G1G7SWYLmc
         3w5juN8NFLnbuldiVVqsE0k6bwZqTo2KpCKh1iwOhZxSDMlRS6Au8IQ99ASo4z7KBDAm
         n0DYAef6JPLOePwEzvWpHGEja2eKMS60jeP35Iwr6vChBMw+br5gXzdOG4Xq4dLSMHVW
         I5Aw==
X-Forwarded-Encrypted: i=1; AL+hErHlhzpO0w+UCUTVFXc+jC9Iul+g/1Er3ZBnZ3Y6QvMJnA2a+L9aSL/eeqlaPUMkL4UxpZyIh2WPzyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x24pHJKzY36O6V9YVM/dsj2M4ZWr36mCBvPX4SgVt6BdFmOA1
	817V6qTkum7ontr7YhpSitUdYYqPNagpqWFufksNvWYLE/yeVKX0ChGx8hUDU1oz1Is=
X-Gm-Gg: AYBFou1BDkLP98AJz6UMuNhgM/nfCl8Kkus27IZGrPbFKtHJD4P8IVG1RHW1oTxeI+I
	HQr6/2cZYJNcQU3vSo5JiGostdAXnT0ddUSaGvLDPrLZ1jj8Yfomlw44dvTFsOxYHAFF2W57C22
	TkNoy7l3DEoTrKWZgbpw9IQouur1kDR/GsseKFVoqAC5iLqEGj4EjR1+/CfOuWXyuBTvEfVHkJE
	eyTEHc69vnIbwte9M9GbRCSHYdjY7zOlPttMdHB2KlAtOiU40RaFr71L2hc6hvi+EDAEZed/uvK
	//EYSaOPnrM5ixrA1YfpqNS3FKo9WIdpdPHkzBiljj3chdfF1/j5/IbndEyanFjRg2m5BqEfLZS
	D+kTXc5/U033womwO6lGcKKllnlN+V0u/wp6LLpwZGaa5bmbxdNhE+liulV7saj1fO/XXAm9aYx
	xQ0tEIvmh1RjnmQHnEc4chRp799VKaT4lgHe5g3pxqYRGiiNK9kc7MW7YjxIOl8uiuqFOZO5spu
	aHkLG0blO7mot5QXz4efr69tavqZn0jqUPQkYnZQroAawdGkqLysE0y7/TI93EONRHfPCsjoXaE
	Lj1b2YV+7uNTupG9G7vH6xY7Msn6Tqec0+zc1knQ0ykU9EIxCkRRtwJe3ZWQFDeYqh4X/LvB6wE
	oZf36zhY9tYTzYw==
X-Received: by 2002:a17:907:d40d:b0:c50:5275:fb97 with SMTP id a640c23a62f3a-c510e5843e6mr491548666b.47.1795089727668;
        Thu, 19 Nov 2026 04:02:07 -0800 (PST)
Received: from ?IPV6:2001:a61:13e6:9f01:eee3:1629:f0cc:42a? ([2001:a61:13e6:9f01:eee3:1629:f0cc:42a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm10686055f8f.43.2026.11.19.04.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:02:07 -0800 (PST)
Message-ID: <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
Date: Thu, 19 Nov 2026 13:02:06 +0100
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
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data
 into sense_buffer
To: Alexandre Becholey <alex@becholey.ch>, Oliver Neukum <oliver@neukum.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261119084526.535901-1-alex@becholey.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261119084526.535901-1-alex@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.11.26 09:45, Alexandre Becholey wrote:
  
> The special case is not needed: for the error handler's own REQUEST
> SENSE, scsi_eh_prep_cmnd() already points the data buffer at
> sense_buffer with at most SCSI_SENSE_BUFFERSIZE. Handle REQUEST SENSE
> like every other data-in command.
Hi,

thank you for looking at this, but this fix seems to not take an
approach I can approve. Where sense_buffer is pointed to is
internal to the SCSI layer. We cannot use that in an LLD.

If you think that LLDs should not use sense_buffer then the clean
solution is to remove it from struct scsi_cmnd.

	Regards
		Oliver

NACKED-BY: Oliver Neukum <oneukum@suse.com>
