Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135A23A451B
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782654914; cv=none; b=lBaV+HhtwGcFZ9VZit4IxB1+vEO/81sGFhoOnbmbNninUifm/6DX+Ywu7lEDh6fIWT82utkFuoEiZ2Wl5XTaS6CLHSthJ4G8BaPauiojJ9/pBBxOL1oAa7UYpKK+iX9Z5J+J6wkP3L+izrenPTd2EcWZUSjVJnjsB32HdXn6xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782654914; c=relaxed/simple;
	bh=G/Jtpz2dyjwRZd8CQBnGefINIJsyzwvfZ4xUAeMXeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpER5XaK4IFGIQ1bzPvQpL1cctcQ8VSIqpL4N7Dzt8KfE8N6sKgkUAZmuYaxBds0pMi1AQLRWjnmfaPEhlkfhZemVhDhZMI3ooR4UgrZes+Of8WRWxnl2fxuoYETjsTgT55JohUFZuQ4utphrx4lztEu/UyjiesRNZ5kcul0uyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kCyY0u2p; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kCyY0u2p"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51bf11ba4f6so10224621cf.1
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782654912; x=1783259712; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNV/A7emqW06YSeGh0bw5IhKLR9YF/fHiPtbm8SqJPY=;
        b=kCyY0u2phgACkIT5UOY80q1vsTHAJQDit1ezltfbcrwIps1AXXDVt+J3/LtHnIhMpY
         UO/ZUa83LXtyMhMXXyeM57ojNJHAnpTbQ3oQjbbqAGMRg7jELULe92UQGG+U8ddCd1It
         JFuVVMWm1VQexfu5wN4n9XSbRepM71K7PcJFaAi81Fo6BkjfX+/yjz+RPDggF2l3Mnjv
         JLFsT1SXdtBoEVj5Vu+BwrWv2/eV1PiIbqyrrHRS3e4HVv66PEZj5KITNpfjf08FY9Or
         zZrkmVNPCpL4r834jgM2K87cHRZWmuGJ8+KsOCNf+KlQFcVXSFhv0TgLqKmToCgLX/LP
         KaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782654912; x=1783259712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNV/A7emqW06YSeGh0bw5IhKLR9YF/fHiPtbm8SqJPY=;
        b=GcELxY4PzddDtc6czOdUZUwkUpsernycLB1qrTl2Vum7bQM1QMOzntyuE30Y2HLqzM
         QqtDMzrd3AR18KdFVnJXwHlHEXg8Fwkm1AHYhbr+eAbOr1/MbMCXAEf+oJDriMM0F2r4
         E2IfLJT9mB3x8sDF1fnBRgXnjmOqHGoiWWOKmaJ1pyexGYsdk5nuwFXZK7fiB+M5aszg
         cXq1BwkSN+2v4KIRfkJmoGTg0b/w8wqXZ6zEl5HqfZ8TF92CH7UUfNbXpCiPbqfFoTeE
         S55xdZJBk8HNpGZA2FtNGgrGcZ79ujMxU3fIuw8Bv1Vzqdr9/jbRqUsPPzvQpmckfd9y
         HKJA==
X-Gm-Message-State: AOJu0Yz+476qELmb2ZSjtTf98Dk0vUhhVP8V74+NGfoNvr8gsJygdpZO
	krRu8+DCatx4I5F8Mhc5MqRmKTRJmUi4tZ7IFsTiwWULBkCMmb7CK8wZurAWBrCeb1aZdnLiGyD
	neFW6Tw==
X-Gm-Gg: AfdE7ckzXOiBgZuQ9818W9P5Jm8THf9rvXQdTyE7U/GoCkAlB/jYawJu9C9rcIjps59
	l9sXNzcLsAOkO3UgiyFxdHysvwzgGNxswRRUyKisR7RNF1PK6eTiSWk9Hmf4b1qb10oLRhlhwkF
	c8NlyFnhGf51czu37QzU2/RVl8hcbI+YbLVl7yh0hWnBZnj8WjUa32ZSoArWQR6W/nxFEKHEg2G
	gm31D+eYjjBH5R7q4euMc/WTfXyBzSxPPGmxl7t/59juJMXHggQCaAFsc/cMohhOknGgaERKTLT
	H9pLlTKoDs1JjgMYpWx1iHejbu7zGj/pL2r0dL5U/zBvWY52Sk1gHXKBCed9bkrAjGunbhsIfbw
	Wcpx36sN4EdxmXokwGa9sMFncAMwkvw327p7M95/TwJYf4PLQNnwHUCgEwLIitxFleAfLvgUNs/
	crr1NT6g+BsQCXJhn2fsVwXSzqfJcequ7V
X-Received: by 2002:a05:622a:4010:b0:51a:8dcb:d9ff with SMTP id d75a77b69052e-51be5ed80camr62533671cf.51.1782654912134;
        Sun, 28 Jun 2026 06:55:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a514b50b9sm140835361cf.3.2026.06.28.06.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:55:10 -0700 (PDT)
Date: Sun, 28 Jun 2026 09:55:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>

On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> out how to make it properly work with my patch because of the
> following reasons:
> 
> 1. I don't want to move it to the top because, from my pov, there must
> have been some reason for placing that quirk where it is now. so i
> don't want to mess with it.
> 
> 2. Regarding my idea of adding a condition — so that it doesn't change
> the behavior when the quirk isn't set — if the full configuration set
> exceeds 255 bytes, we would have to issue a 2nd request. In this case
> the existing behavior would be more justified.
> 
> So, I'm a bit confused about how to implement this properly. Adding
> yet another condition to fix the second case doesn't feel right to me.
> It would look unnecessarily complicated. I would appreciate a bit of
> help and advice.

If the 255-byte quirk flag isn't set, do the delay before the second 
transfer just as it is now.

If the 255-byte quirk flag is set, do the delay before the first 
transfer.  If a second transfer is needed, you can do a second delay 
before it or not -- I suspect it doesn't matter.  If you want to be 
safe, add the second delay.

Alan Stern
