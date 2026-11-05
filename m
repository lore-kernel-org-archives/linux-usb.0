Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908485;
	b=GIl6TYXbPMg3UuVfWXz0q7DgxT1xWDSHjffl0n1g4VSOnAIcsEawcqut4u4D+wMVTj+/
	 YPn2qgAumaC59mFXCinzFtiTWvkOpaRdU7tTflLAP1LH+GMrBPZSWRloYTFfv78d8rehv
	 C2qnLW3jSGIcLwUNHgzQ7WXgd70viDZOn/iA1utGNaj3UlLR357GQbKStVwlrXuUyBwSo
	 WLR7XNA29DbFrTHrLk4wCIhcWDoBsahlMVkayrpnciuvfNAhMb0y1tahjn3g5LZM0Y7Q8
	 Dz/fuYwBOU8gVELHAycbBWGwIKlAg34apUXU6I80alFK+fEed4gkIOaqqubFLX9teFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=P3z9bGlPz+HOdGSEorQowq7AR0Odyvz2JKTGY+QbQTk=;
	b=V3gV664pJnR/iPrkKE98A+/Grp2Y4Un1k1zDNJxK8B6F8Vu1VLJxm7wWYpksHhcfbbYC
	 TDuRAWfXaTAp8gMm4RSfUtN0BA7ek7xD7R9CJ7C/Zl7hUonGQRfqNucPSPWr5FIHH9VOn
	 RqMCPxIAMO5VMugnjVT6XqeHJ9FCP7hedG4wJNOpKn0FhE35ZlrxaexxTuuB6M2UXD+nO
	 khhQa4JLuzI71duIHzgH3ql03boHveef2+dq8DIKYraeQtYxGxxPT7L/5QIF6HFktLTAl
	 ypz2f+JRs/OpkdTbyzLePNT6ZMPYbO21YI0iq+zdksTbc8AVSC1m/+deVoKRHLpqzLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OkB7shaJ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F81606D808
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 19:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F81606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OkB7shaJ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb628232d2so381442a12.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 11:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793908485; x=1794513285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3z9bGlPz+HOdGSEorQowq7AR0Odyvz2JKTGY+QbQTk=;
        b=OkB7shaJTzMRlCyKKMjmx8u/R5SbbkhOpZYdtx4+tGnwn+gyQzaiuY0dtzmLluAqaW
         Kr6adLhJffd+ovxOyN3g8iHsrgD9s/xxBcz9NhcbDVQ2p8bdSvp5llbE0Z0HP6jLKtVo
         PlPIxjzA8+7ghHGd5XJ3HQQJzykHoK+bmQTzI06aCQ1nQKpNoyeUljfAWWUbvZG+0XbQ
         DxYmi2aGdXN2o9N4n+rUx52Kv3ThNOyrcMDnpCzTanea6eCVsxmPFvRfrljt9bKEy9XJ
         LSEsN22xXDwFx2iMCqtkbigApfZuC/erD1ypb0PG4oRFUg4RjCTLSXGADLU+G/US7YkE
         6YPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908485; x=1794513285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3z9bGlPz+HOdGSEorQowq7AR0Odyvz2JKTGY+QbQTk=;
        b=T9rizCiaEk+YiSH4cAQ5lxAGy2jMM8YB65OjjFXjNKfn3g/lW5AL6Hi2jCt5i4Kgxo
         ifrQ4njkCOh8zu0xhstP1hU/71X5Zf6H83tJNkfgvCL+3n+RSop0FldiiX4j1mWsaUBF
         0F/QprbZ4NTxvJIPnGaDf9J7/8PYEtq/O0BajWCcjRyZHLaZ7lMSvodkXiC/+TlC+5KD
         sNtF4uaeU+VBPM7N+C2MYq+GUF/v2eWLsk9Go1l6mCC5qaOD3eOLEnbeKEB9QJOSf7U/
         etZm4Ghcuh6BLSiq6Reee3cGgRdqw2DPb2bvPFoDqA7u8ZhTcwxIhKICTJrZXO21dUXf
         uiOQ==
X-Gm-Message-State: APuU4Z8F8OxY+yqHh8jSyhk2QxVw3h4aa8xR8v2WFzYqRvV3hcj4/Rqo
	aGd2s/7ONEfjTmP4tSfhhpqxX3xSCMYSBcXMqvO1Sk4Lote3kdtZpw19ssVPmrknIiEVA2zCZcy
	+aBcUTScY
X-Gm-Gg: AYBFou3IFUjqtJOIWOg3+gfLyswTSArOBejTW6iSGcRCI1bZ5loMclMRPTXoShdI0ag
	n/e1Vd+8Hgk8bRoqMRsnRAInFP7rS+Cya4ERUczpGkNjFm4+eO/k1XpYWKhtwK1aXHIDqEvaWB2
	GqwvVimw8bmiIH77mahAYdMTYOkuv/GS7zOlnDo41LrY7FkQp7zm6AN236D/KErd4xlcO5inuuh
	/agoK0TsiASRYP8by1mwEDLc39csrBw/u9XNYunoCHumWtGgzbwt/Zm+tusZrUYtbXXe31do01/
	FCg9BX52DtFHPiYa3Cp/stqiGcn0L1He11kyWWxoUAEy6DMG/+isRV6sfFocKtuAWvIGje/05SH
	NyGtpIvjdnHNDifbXRKG6w43NsLkrgrXe7qLxYTyqMnWtOyuZ45RqdkDsR8BF68VHbxuOK29wHA
	gLYYYd9opZE0pLeGAaauUkV2bLucrSgwn9owmUaR2cTwKs3BFe18n77lh8edr7j+0XzmsGOFqjb
	arZcUAZvvyAaSpu//zVsC6a9mwOHVmEs4dA1E0mcG9KFu76ZnARahfEeo5TU6Grq4r7paV7ejz8
	uyIqbNvHJ8yMRzk3bSb2NH6a4e/wAMP7YWqsCPi67RJ7lN191g==
X-Received: by 2002:a05:6214:840b:b0:91c:a7ab:e4d6 with SMTP id 6a1803df08f44-91ca7abe522mr206988586d6.48.1793908474204;
        Thu, 05 Nov 2026 11:54:34 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea68fa5e2sm3688416d6.1.2026.11.05.11.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:33 -0800 (PST)
Date: Thu, 5 Nov 2026 14:54:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Touhey <thomas@touhey.fr>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] usb: storage: add quirks for CASIO calculators
Message-ID: <e602e034-102d-4a33-8ae6-b36eae4b5f40@rowland.harvard.edu>
References: <20261105151348.19009-1-thomas@touhey.fr>
 <ba500bc9-461e-45b6-b889-3d82107e1967@rowland.harvard.edu>
 <CAFCjBVE3zDqQnWdHmU6rwHHfRrS_p7r+PwsyXhbqVSEk4Vc-Lg@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCjBVE3zDqQnWdHmU6rwHHfRrS_p7r+PwsyXhbqVSEk4Vc-Lg@mail.gmail.com>

On Thu, Nov 05, 2026 at 07:43:07PM +0100, Thomas Touhey wrote:
> Hey, thanks for your review and response!
> 
> > How much storage space do these devices provide?
> 
> Usually between 2MB to around 32MB (usually around 15-20MB on modern devices).
> 
> > Do the calculators' Mass Storage interface work correctly when the quirk
> > is present?  In other words, is the non-zero dCSWDataResidue value
> > simply wrong, or does it accurately reflect the fact that the device
> > hasn't accepted anything beyond the first 4 KB of the data transfer?
> 
> It does, the dCSWDataResidue is wrong. We made two experiments, one on
> Linux and one on Win32.
> 
> 0v0katai (quoted in the commit) tested this on Win32 with the default
> driver (USBSTOR), which seems to already ignore the CSW residue in
> this situation. They wrote a random 1M file it, read it back, then
> compared SHA256 hashes; they were identical. The writing part can be
> found in the attached "test-win32-write1M.pcapng" file.
> 
> I tested this on Linux by applying the quirk using "options
> usb-storage quirks=07cf:6102:r,07cf:6103:r" with modprobe, starting my
> Graph 90+E (French variant of the fx-CG50) in USB Key mode, writing
> the file ("test-linux-00-write4M" file), detaching, reattaching,
> reading the file ("test-linux-01-read4M"), then diff-ing both the
> source and the obtained file. Identical once again. :-)
> 
> Let me know if there are additional tests I should run!

No, that's fine.  I just wanted to make sure you had considered this 
possibility.

As for the patch:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
