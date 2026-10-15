Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF83C65E0
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076077; cv=none; b=ZKVz7zBC4fiU9JJL0OsIP0uWqqFaPpvcz7FUx8J1rpvpuvr/gpzEvpKcDaY+tgD+iXzJr7pKBDa67BVA76xZ4DWAlWRfEd2sLrkaOcWf08qn5QVm4UwSlqnuWv936N/YOskFv66nAUwok8RgpAnO1ub8R8P2iPwztnrzTrwfBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076077; c=relaxed/simple;
	bh=HIQoMpLEo5EkYHvaoYGnOHhpqAJVyOKgam7StWXbF88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkqkHv48OGf51Leh3gMuK5gzF6fABx5Yr5h0mQaZGrwec7OGaGfZhz89AdeF+WzF5QHInFi9dBPX3GDyrloXyh1G2qw50C3fhwFDGcD1GZPvhdeqr3d0zb70YohigAIQ0zZ0xw8iIV9J3lkcaG8zXmz7J1TsEtR2u07WbpdTKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TM0GWTgT; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TM0GWTgT"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-919abb3335fso63637116d6.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792076075; x=1792680875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxviSvGtqma9qI21YkCLCCN0FNhTaTTHRF33FR1bpwU=;
        b=TM0GWTgTCr6XWAw6SqZM2m542tyuUcKIfUK6C8fYu4EDn9bc03hkjBOjpbrNzqnHsm
         eD+InWNlfEzfLXajx9WtJopeZlDriicLf6hIXJHG5PHaZ7Svuh9JTHF5T76jTCwvWq2R
         ZA/K5jgOHhlfOWz8m/raFhECvmy/EVZUVZ/e0UDFlhnUYFakq/blMbuc5VTDX/riVRjS
         ljliwotjmdJnFinCqN/27K87uHLvYeazVx3XMSpccht8QSU11lmHZA/54UbM1v36MXpv
         YOugR3Uu0CcFmdGa+7ePwKK5evDBiKKFuLcYpGcJKg+Y5qzawS7IgQedKSP2/gZ4VydN
         O3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076075; x=1792680875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxviSvGtqma9qI21YkCLCCN0FNhTaTTHRF33FR1bpwU=;
        b=tfjQLs2aJ9O2yJPBZ2UN3xq+0eu7Drr/guhd3QrYe5HetDMkbACwJOqDVW6rFypVCw
         z81/xQ9Il214NyincpTz7qmfuSD9aRlQZvbAl+VE1e1PA27TFEnzownTa6UmK9aFBOkv
         ra6tfK4r9Dnx7p6BxRTt6VvInVlWqWVQYlG8KWq3zHfruYHYV7DPpLDlmcJv8iP83zd1
         4yt/ImL1PFij+CZHz4uaMTM24ozgXH8buQQxxJZHJVMdIQYct4BEwRcxPzbUpQJG0+eq
         mknj/mUpOXG6pGsXvCp7leMMLzwK7215LonB7n+AQgnsi/efXIJHhgPG8Cx8cqQrDkLK
         OGLA==
X-Forwarded-Encrypted: i=1; AKwUvBzqxfKWqA9F7UbkLp92gpKN1LzNo0WXJ4KntDRSrLipJpjK6QMHYnVMwHtFXFEAqfbXoGYWk6YKUfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMrvcc11Jw04wpPuViAnigvArgHO2q/97gKgKyu6w0FUZ1/IGJ
	DyNJ7gEJtPt5oVQEdUHBOqPa/hnpGpQJWK88OVf8t3fE6O184G/Ld7pCwmLDrfE1f0azGroOQAm
	5eMk+Rw==
X-Gm-Gg: AYBFou21hI7XeB42HcLi3XKTbV1i5+COoT6ms5n+Kg1OKCnPkvoCHJqqyTf40uiJx9x
	pEhhzgAwKcn70V4kfDu4XzF5WgSd2Jy0CxAO1AW8PNIqfjAxkLc+8KcMijJ5hEhT7JlMc6sRUTJ
	+r74zs1BKc8y9kQfW3PG858/TZJSyDKFfmdnf54BdHDEFnLJjcXxGfHTHZVx5ZK4vsDoeeZcE4q
	h1q6EBKEGxqcAcK/sfzqud5VJ8ojgkFifHblnE21LzG+ZYOozAJpTAPPGkh1aQBdJYs8DYciT3P
	1qr6lufaWSdjkrOi8JCUBo/xrNoTeAjHNsYlneancMCbr6P4LDmFxMGUXg+5/GrmosrZUy9iVvj
	y8HR4GLqja/Q+aCRfHrLSPcgxQnSg/69A1nPlK6X2Ob0vvDFmIyggDZdsMU3eiX1mKPDmKZ0eMA
	tj2zzuWNu7FIzhSlz8JG+gvLlnzCENmo3NV6DyQnyCVIGjsMEa+2rlHU6bkU2mlHT5Ag9vJG87+
	rHqPRVGcY2hWRQP
X-Received: by 2002:a05:6214:410a:b0:917:c904:4ae7 with SMTP id 6a1803df08f44-91b5555df66mr357167686d6.42.1792076074639;
        Thu, 15 Oct 2026 07:54:34 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b38700sm82983956d6.11.2026.10.15.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:54:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:54:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Reid D <skibletz@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
Message-ID: <747393c4-4824-4a06-9747-3fd74028c2d7@rowland.harvard.edu>
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
 <2026101531-secular-entire-f7a4@gregkh>
 <CAGNJ+_0ShEM-G+8p3oHx1uF8rBtC7JyqmyFzswDB50qsW=qwuw@mail.gmail.com>
 <2026101509-reggae-whacking-6598@gregkh>
 <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>

On Thu, Oct 15, 2026 at 08:07:49AM -0400, Reid D wrote:
> Greg, sorry about that.
> 
> The fix moves the USBFS_XFER_MAX check to after totlen is computed so it
> validates the actual transfer size used for the kmalloc.

It isn't necessary to do this.  The check you added can never be 
violated.

To see why, read the code.  The first thing the USBDEVFS_URB_TYPE_ISO 
case does is ensure that uurb->number_of_packets <= 128.  The loop that 
accumulates the individual packet sizes also limits isopkt[u].length to 
be <= 98304.  Therefore the largest possible buffer size for an 
isochronous transfer is 128 * 98304 = 12582912.  But USBFS_XFER_MAX is 
(UINT_MAX / 2 - 1000000) or 2146483648, which is a lot bigger (about 2 
billion vs. 12 million).  This means the calculated value for 
uurb->buffer_length cannot exceed USBFS_XFER_MAX.

The real point of the USBFS_XFER_MAX check is to limit the size of bulk 
and interrupt transfers.

Alan Stern
