Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAEC3B2FD0
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023266; cv=none; b=uZKeuJhB0ILMRK/vpHylqkEsPDqVDAFzSKQIK2Mts/lin0hv6Y9/ASt+CtRd6Jpt56puLdjGfN9ciByDguV4MsOKlrhpU15ATo7OlNXx8O9h5ur0FP23jg18PoSTaVrlXVWa780QGNz6+FtXYWRyWXBkqmT9bOI0JSD0Y2yTMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023266; c=relaxed/simple;
	bh=9vfth8CG13+m6W+PES3gKQQSNu3mhuo9ch2s4Lg1SEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXbjGSlbuZYRzBynqTvbmQOCQq6Vv1OUyk9U+XuEnKW5tojdmibya0Vue7YGnu88jL8xwNf+12+yU85wjQkApDpVn7gfBcfQ0hZQAEmvoWtPyYyzIevBWWgLWQCHDlhL4ifOacT0Wha1kNeAB3JmuYrB/hpa1t3vpLaDxLjfvuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=D+C99rB9; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="D+C99rB9"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8fcc43c48f7so40112856d6.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787023262; x=1787628062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=D+C99rB9XNm2SRqb5rGERM7sZByODYQ44EvY5fJx0KkyCuCt3zW58YGDosofD1Nk1X
         4kh5x8JynYEyB85cdfBy1KOI1bHdBXG0LV6ZdI1Xln+6HkdaWboA1/J4FI5D28YjDOLr
         EamEkDwY2kZpNh2X/ITWPM6VroloaOFWdILjwL6VeqOInvKMQ9aWddPXPVukWTPP0vux
         bRpenw5IKAHhb+ocZ5tYaUkhpTr+yxVsfNh2LMt3nhfdUuzxTR+ZWniowXWhGzp1kSCx
         ZNx3CthZjTiqyiYdrHy/LOvR77A1easncxhjLn+STS4DrCqVyXyTogVJ1/h6PgPxEJ3h
         L0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023262; x=1787628062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmj8lP1yFjzbA+ervTx82nLhcjYdqK4FiTBNDHNyFKc=;
        b=bSXC+NgL5pzTFv5qAK27fqUb39dHlScp275F5IGjAJ2KTbuctDOoBcO6WWQ23rG8wB
         N2XG7altg6QEs8cW1F5TZj8/ipskGiHxB1tdYtIhbwl5kRaPMxbVBsa5ysckgwvuPgbP
         0QnPXUbZAghA9jg6IYMOAiQyNHUTI5W6XgmSPpG9gwPIPpZ49EIYEUAtclXUf3wNrSFG
         FRRzq94K44lEf62KJct8bui1ovGFtAxjnJk3cobw8B2Ha4kAkrWW3i9SsxBgt6jMa9nK
         vOsItyrSAaaYOAPbhNB94cmcjFv55DMeYhViEuHAGqHwIJ0J8mfcl2DtDwBrnaek3BOb
         GKGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+Ysp89r2OFqkIl+XCdM5HIux+vFoe4eoNFrAqUlg1yzJnFFGtOwTUggvVMhw4ai4vT/+890VltPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFh0lAdVgAUmTDFpTEiWW+Xv8kAo2IAxanaKoIRTRuL/8Dxz9Z
	/Ik6ino0niY1SvOFzCmRaFtMhZrPRpgYO3jAJ2TSGfncg9lbqSGRyslis/UXv/tqBw==
X-Gm-Gg: AR+sD138zTPyJeQJAGOCK1LjUo5Vhi50cP6LHLEwFzu1GjaJA3Y65u2KUQUVQnKUd5u
	Qk6r27xQsMzRDGDUa5Af+3sMT4y7gMMPqr0DuIrda5HdTv4/+g2hcBKFeJtafec2fcUjvPqxmK7
	1ybPZ20z793820E2bctypUKfrt9kpni7Zx6+PH3sez9tNY8DYEheKuFsdfpmwuKXf5pJ8+rqPXZ
	lyyDDO8nm5l0TwMPWb5OsPo8KnodvlSuuSPR1m1zkaC4dbcCYam69Pcq3fuAKlBUoVetA40GU35
	U6Nb4RG13rIQVljip/juQEXCIJPnDovOlKGgQQ02WbR2shTai81H3RYBfsFpqrzDmMRWK49ounw
	OFm2oqSkEmqOkt3Hjlg+6zHgXqQblu/yhTyFW3vbtjln83QSPNI7pEQXIjQUGKGivC//rGph8q/
	uGCSplADPhnosGRUvgJQpbG2pzj7rTQGBlx5KhJSRphh0S0QlLVQ31NWbAm6+tZg==
X-Received: by 2002:a05:6214:2d46:b0:8ff:650d:2b99 with SMTP id 6a1803df08f44-90a91a2bedcmr366357696d6.0.1787023261794;
        Mon, 17 Aug 2026 20:21:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4583a412sm22883076d6.12.2026.08.17.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:21:00 -0700 (PDT)
Date: Mon, 17 Aug 2026 23:20:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: george.0xfff@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] USB: core: add helper to queue device
 re-enumeration
Message-ID: <a22d5d46-084c-4891-9a32-0c9f8adc60c4@rowland.harvard.edu>
References: <20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com>
 <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-mt7925-rfc-v1-1-284d856ac572@gmail.com>

On Tue, Aug 18, 2026 at 04:55:20AM +0200, George Maraveyas via B4 Relay wrote:
> From: George Maraveyas <george.0xfff@gmail.com>
> 
> USB drivers can use usb_queue_reset_device() when they need USB core to
> reset an already enumerated device asynchronously.
> 
> There is currently no driver-facing helper corresponding to
> usb_queue_reset_device() which allows an interface driver to ask USB core
> to remove the current usb_device and enumerate the physical device on the
> port again.
> 
> The difference between the two is that a device reset continues using the
> existing usb_device and its current enumeration state while
> re-enumeration removes the existing usb_device and returns the port to
> the hub code, which then discovers the device again through the normal
> USB enumeration path.

A device reset continues to use the existing usb_device only when a new 
partial enumeration yields the same descriptors as before.  If the 
descriptors have changed significantly then it goes through a logical 
disconnect and re-enumeration, just like the function you want to add.

For this reason it's not clear why you can't just use 
usb_queue_reset_device() here.  From the device's point of view, the two 
approaches do pretty much the same thing.

Alan Stern

> Add usb_queue_reenumerate_device() to provide this facility.
> 
> The helper queues a logical disconnect on the parent hub port.
> hub_port_logical_disconnect() disables the port, records a logical
> connect-change event and queues the hub work.  The hub work later
> disconnects the existing usb_device and, if the physical device remains
> connected, attempts to enumerate it again through the normal hub path.
> 
> Any retries or port recovery required during the subsequent enumeration
> remain the responsibility of the existing hub code.
> 
> usb_remove_device() cannot provide the same behaviour because it also
> marks the port in removed_bits.  The hub connection path does not
> enumerate a device on a port while that bit remains set.
> 
> The helper takes the device lock required by usb_hub_to_struct_hub() and
> holds a runtime-PM reference on the parent hub interface while the
> logical disconnect is queued.
> 
> The helper does not decide when re-enumeration is needed.  That decision
> remains with the calling driver.
> 
> The following MT7925 Bluetooth patch is the first user of the helper.  It
> requests re-enumeration after the controller has already enumerated
> successfully but later fails during Bluetooth setup and cannot be
> recovered by its existing reset path.
> 
> Signed-off-by: George Maraveyas <george.0xfff@gmail.com>
