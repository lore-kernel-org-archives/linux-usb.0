Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A33EC81C
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504142; cv=none; b=jqMHglhC91w7wJN4A8IbiMzZEYMde+k5OmQdYCUCX98PqsKTE75Z2XjwZ2PTrrsftLGqCEh0qnvbOY5/OitWJo3/cBttUUEjquTwEB38rEwvxl0xXRH22sIjaO4ZPBvXj8wLip1Z/YytlqLWZvEqXUWhdElOBSl+Q+XNCwkwl9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504142; c=relaxed/simple;
	bh=KbjRkXJlUS25YE760X36j4XYlscBtr8pZP3GRLl0onQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opyc1B2NyANSkTToB9vchpR9GLSSXhH7qfftO0mAXclFyQ6ohzfkgTNFFFTXbucHiHdUcxR9a3JaQxFiPZtYEzP4rK1jGczTZ2bLdJXu8aBi8qlK/dbChAz2r9JgZQ8OCom35A3UOokSIImZJOyNQbsrN/65m+B3MB23Dgfnwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q4LD7efg; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q4LD7efg"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e54f8c051so49362585a.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785504140; x=1786108940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O83i+oz3eGLyt6inNlkK9pMabvksTSzoGTFsI7XGuIE=;
        b=Q4LD7efgkv4UrWK8ZIEGrcthcxjJQx8AjfwOD2gM2c4W56XTF4SyvxAvCUms+xjIS4
         AEsS4NqEJmnXNMnX2tbrTmVmnZZZ5ZbVhW74/g0Ycl3a9uRwp5gRbPSkjbyujaeqcqLd
         wMvWokanYF4/Ck3GiL4j1O2UUCN7HCjKSt9ri0ORDM8o7G0bGkLwwD+jgotTlpY1a6VB
         MdohG/3BesRJzWTTLUbyloaykxReEnEwKy4x7B4Q0TA4YxTbabbPmlUQ+C9fvquVxv2S
         k6sAUMi+MJScrEoJZv5Haqt0U5Pk36OJC5eVpvrL2udIvQnUCBVBnVYJXGlE7mGd/3R0
         1z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504140; x=1786108940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O83i+oz3eGLyt6inNlkK9pMabvksTSzoGTFsI7XGuIE=;
        b=ERYy03KY1VyOZAf0Vz26kEIyKQR8E6AvJTDAiRWK+qrRrwUXRKcV3xIrUXD4hute7y
         dQlF0NLfcOnguCipzQEQUQoADv3wXsiUsG4pwrNoZ4Pmvg37xttb8Vbbt9VlRICaher5
         4PXxg1RoFYKDt5+dkcfT8SvJnmLBwJlmfx8LbeHBh5yKnZwIuQNLF7ZfuYmFTyxW3Nsu
         hZAlsEOeLUPD6NeH/qZgXflhgjAoMct+M8us0XSWzZUAnnpt789r3+hwjWufENb+MmUz
         SCBeRixFO8PrOQzy8zLxDIvwXYUOR2dXttCgraxb6o380109w2pMVcclGrovcEXNS9tG
         y6+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrwg4LKOvZ6eLwxA9o0mPkqA8sXiM8Zz82WPfSKbDIx8mlu7B7Ql4UervIE9FLLR1FFMuqZuxnav6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRGU6x9ZvNXxlofy3fvxn8zuD8fYjy1IHSOs5hCFEHyZVtVEPM
	zYqnkVlgyjzEZZUpf75uUCwPF5UBbKd6DsssGXTZnNdCzudU7trmCAACvI+3G6wNsg==
X-Gm-Gg: AR+sD11PiblEaDjDiDSMoCQUaVcHZSVs5bPPN6GD1srelUvfjJ39qhmu4GETrJFQb7M
	YA3ybvRUCveEVbFoHpbvpGKafxYBlDQEZUctNs5QLFMlkpok5nNKEGwSnK5FT2cve8ewx5D8JAv
	AgSAq3KUbirMjS3llm2rMpLWwPOqiW5pX8PLrQuYxnnJZfICU3mvX2TssSYNvi0HOuYvgf7G3sF
	eeOG85pBWEmbfTJWuB2dqR4ud9CfDtFh1k/hHTHmv/mTBCuhqeiCNyIZGJLRoTYE1/O4MbGJWKe
	NfRAb97pNLCybba0i57hVhg8LZt/Y/EhjK7BLVSv3zimcHPn2AAvNFIg5x73zZl7aoewtFiSCr2
	YeE4XAMCaXNylDsZcdLJ9P82utwU+5c0YCLSow7ChNEMAu0Szgu2GhLmneBHKsIP+e2vQ69u7Ge
	xOj5w7YcfE96pH9F/WuZZPLWXvz9FpucNFOSDziqN6iaFDUr6n+MXAzE9SC9h9xQ==
X-Received: by 2002:a05:620a:a283:20b0:92e:f41d:4730 with SMTP id af79cd13be357-934965a0f88mr254625985a.5.1785504139720;
        Fri, 31 Jul 2026 06:22:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c1cd1a4sm52815585a.37.2026.07.31.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:22:19 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:22:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, jack@suse.cz,
	brauner@kernel.org, mjguzik@gmail.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
Message-ID: <e677293a-b01f-4c0d-a0e0-ddcfd3a7641d@rowland.harvard.edu>
References: <20260731091316.14145-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731091316.14145-1-kartikey406@gmail.com>

On Fri, Jul 31, 2026 at 02:43:16PM +0530, Deepanshu Kartikey wrote:
> ep_open() dereferenced inode->i_private and locked its embedded
> mutex before checking whether the underlying ep_data was still
> alive. destroy_ep_files(), called from gadgetfs_unbind(), can free
> that same ep_data concurrently, since nothing prevented an in-flight
> open() from racing the teardown. KASAN reports a slab-use-after-free
> in ep_open(), with the object freed by a concurrent gadgetfs_unbind()
> -> destroy_ep_files() -> put_ep() -> kfree().
> 
> Fix it by adding an inode back-pointer to ep_data, having
> destroy_ep_files() clear inode->i_private to NULL under dev->lock
> before the object can be freed, and having ep_open() read
> inode->i_private and pin the result with get_ep() under that same
> lock, bailing out with -ENOENT if it finds NULL. This makes liveness
> self-evident at the point of use instead of being inferred from
> device state, so it holds regardless of which path frees the
> endpoint.

This is a brittle solution, because it depends critically on the fact 
that there will never be more than one dev_data structure at any time.  
Someone may want to change the driver in the future to support multiple 
gadgetfs filesystems existing simultaneously, and your code would not 
allow that.

The normal approach for fixing this sort of problem is to create a 
single global mutex and use it to serialize all open and destroy 
operations.  Then it would not be possible to open an ep file at a time 
when the ep_data structure had been deallocated but the inode's private 
data still held a stale pointer to it.

Alan Stern
