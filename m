Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912939;
	b=hQIHDCWSsUuyl4qn+a/CzcVLKRSNtDW3scXKP2jnkY/K3bqlQWPZUJUUiHahLj0HTg8n
	 mwoFxOf2vOG9ngP9UUWiKsnZBxFO40lnwF2aCGJuwgL/dgVR6zY5njA0apTnC1dMdoHi0
	 9b9RiJk8/Hu1Fl8uho2l5Wk2W3Cb9betO5xG3HECIT+KCZoRp8rfUwVPQ8MKrkpkLbrVT
	 AgzAr2WEUp3penzssDMq9OjkhRyn5sMP9u04y2nYhYCKqleeJWuyfSV6nODhBOYVkIaol
	 Uemb5GKhGaRuLzHnD3Rx4/1n1ktcjW76T02wyBebM7BVxhwIKYIZDVxRt8qY22iFHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
	b=HR8OjOBt7ZHfHOdY9dhqcyUFuHpT4/GLGFosTfj50xe0DU7aPeUtPu8dv/dcrsauB2kA
	 Ow74gscedih02NbTvGQs44k97gsTRHyPu0dwKr2w1F500Gjfk84DpYIq72Aj+iEqihRmw
	 EJ/08a7PJMgJUuTVbFGNnvfxGBiNpnuigGvKi4I+PTE6wGe9AAoweusJYo4EcXW3z0YSs
	 HM67ouzPvKbKWoDULVMXhSi6dHNJvUdCVy8gn30/7FmPBYdxKt4hOMvtTWubHcSQow1KL
	 ESRY6vFwvGzdCm1kZfYv0yI87AGDoghQD809x0EVKQnTDd2s/4sTm7g5E8sJjTd7QAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LSrGiK1j;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799346082BCE
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 21:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 799346082BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=LSrGiK1j
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c75267b0fso24248576d6.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 13:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793912938; x=1794517738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
        b=LSrGiK1jiy6V885V9jN8Bi3b6sNFbX+dZ266bmKi4t+St0LvwHyatzh97rXhiGOqcC
         CaEDvyj+s5LQxu+fJ2TeQJ5ccIZUwni7qUOe6vtSI64pxjTjVU2hXKfVZka0bTeM8jKC
         9fHm6CoZXeXwQ5UVG1VyR21oGr0GSG47dCWP/sHxbVqLkjNtgvMVE1tWreBvI8N9fg0t
         nFi9UELQyynrPUqvfCpwssW21Jam3IDVvy05B/PHNgD3/N3v7u4JgyRmZ7zsrpSBTGQY
         NYZ4EA34HR24ZnF1iwEUqy72umQyV2ZFl8CQQW9WMEqJ1wHDStInDTbhwqROPgfvApI2
         KbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912938; x=1794517738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmrbzV1PCoGNlOYAhGjRcBVn+qyXAzla9Guh3ab51sc=;
        b=ergty8h/TNsMj+qZdN7Mjxaw7eLD9DuICC3uePhtvyMHDzQpYJ0BrC6j/C+bI2JEAb
         Xbt7DNdFkOK3/fzoiloZMPbwx3BDuM0KlSvEbMZWGfIYQH5Lk4IFQJq6KXOBEyHrDXBf
         3fGZfYiYSOASqukCRpHcBIbijfR6iDRMEpXz5N1xdYUb44IwhoOxFDNXD0xyrTVYOWmT
         Blg7osZ0i7Z2i0ojceSAxh4YylrgOyzFtm4Az3RfNdVbE0UrIVVbEEhTVBLDvE3bthTy
         HSpNDdqH/Bwq3ZRxUngjByanfAV2k0Acus6Qi/SAwS0LtJPOkxhQ7VVC3mYnAmSJXG3l
         FTfA==
X-Gm-Message-State: APuU4Z+bTDWq21urlQK2GPI3zi0mrO0fFCBjwsgP1jfDaYbTtwc6+Ok+
	6eg2/v2HyyDif3IbGEoTjwlkbOgUeaEcHLlb9MlAhek0b024jbHBbyEwDD5b2ATyAQ==
X-Gm-Gg: AYBFou00hr+efRj06Sp92mbaILmIiBi3NZsueCseRdiOVIGqUHHFEFlzpj7mVdwOVHw
	0EReeGj+pBRcqx6D2djRuTyoxNA27YflEeuTORCvdWexnUA07OG/yMZiU6lMbmUjR6IQyMOIhPI
	Hs7jN6TZhnS9e9l/xBEGUEcPEc3v71xGj4Eq1H/C/WP1wQ1gm4m+3OJbLcQ+ilQZJ8RQB7XPm8z
	hU4o7TioLnAeGhwaZsdSqLpmCQbtIDzv38cEtQ9jZcNd1bzhvTT11VzjvRemvwAucptaC+/GefI
	wx4oukd8zwFPkoeK62fPsMP7g0uc3dkKC4UDBONuaM2Ham10Hfhf1W7s2Xz591N03pCwgUJa2fG
	Ic6rkeQMs8Zv6IQXFFTKJj9j/15tJLvykDsJ/2d0lveaA9/vulmxSiYXwzeHXVd2eFBrR30ZMzC
	HmeU0OCA+txIqST00xDBw5w3L10F+2jHIbfcpCpQg7NQ+AyzVMYT2n01h4WmvRH93XsM35+t/Rk
	5Dybky6v0kvGBepLL9868xFzWbrQ9B28T+GQN6QNApD+GvTM3n+qF3U7CZqop6qd4z6v5JImkad
	aq6ZksENsOgIFsnCp9QynMX7v6Zm
X-Received: by 2002:ad4:5cc7:0:b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91ea9627890mr3858876d6.14.1793912938154;
        Thu, 05 Nov 2026 13:08:58 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a9a744sm4578596d6.32.2026.11.05.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:08:57 -0800 (PST)
Date: Thu, 5 Nov 2026 16:08:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 02/19] USB: core: signal the end of an sg request last
Message-ID: <c4a8be3d-5b0c-4581-b225-05211a4ae9cc@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-2-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:42PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> sg_complete() and usb_sg_cancel() call complete() with io->lock held and
> unlock afterwards. usb_sg_wait() does not take the lock again after
> wait_for_completion(), so it can return while the other CPU has not
> unlocked yet:
> 
>   CPU0 (giveback)                     CPU1 (usb_sg_wait())
>   spin_lock_irqsave(&io->lock)
>   io->count--
>   complete(&io->complete)
>                                       wait_for_completion() returns
>                                       sg_clean(io), return
>                                       the caller reuses the request
>   spin_unlock_irqrestore(&io->lock)

Wouldn't it be simpler just to make usb_sg_wait() take and release the 
spinlock before it calls sg_clean()?  Then the routines calling 
complete() would be guaranteed to have finished using the io structure.

Alan Stern
