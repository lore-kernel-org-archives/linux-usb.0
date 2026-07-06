Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3303E5A0E
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329465; cv=none; b=LjK3nIiBkkAZDJqiUgwZYiONU7wv0O+i81iyBilDO/DTZOjzgwB4DCNPSB/AVWKdpXpn5TtceyUiWcsw8Ml2uLroiVUykfiHn54jKUcm8rES69pGmAtwoiKh0GdA0rrzBnq+4meNxPUcc9xGM+O13kFSXFsOgPJfDmDz+mQWLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329465; c=relaxed/simple;
	bh=15Vb9KdBP3fVDaEzjGo+0nkY11tyVAtY2SbnETseetQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gc7pEc74tzRMK+x4ulOLM04BsOh+0K+Bhh2mZSa4MGkM/WexJq2cgN88j9PZMN4bpTaGi5nFiAOteROghEH9JBCHqWc+y52ZasMWwPePHGFahdh278ZdxvZTL3jdSuUc/JMjwFxyMtXH7hyFQIv5YDcLO7UWHJkpmYAoO8DkGo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Aro5x5Ml; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Aro5x5Ml"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso692648f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783329456; x=1783934256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLNkro1xxZ0FVFkfbwOoV3dADIchfsZOcflVww3NZ6o=;
        b=Aro5x5MljYFjkHWFyWzMOoaQlQsoEQpRvmnOlZ9EJcDG3us0DT9SziajNnpFLG9rZx
         rZYRo8NTCUy11BCa7mdOc/yUMuKt5x0cW0DN93Arvs+dF5JX07bRyHXy5RHeApOoJETw
         A7P365CxLRVRdQHGVqqgNbEfXxCEagfG4a2umgWLm61Gh6R2067HEu2I6SXirT0s3jw5
         8Ks3qNdmqWvSgFZcpZNCk1atdPs6RCzUbFtB83eRTCwLVHHYKZUcEtdI0ROq76K2DQJL
         +/YI+WhcFVZU1WdkPCjRloN40KMu8snuIqBR9IEatZAGJ25WkrprlziGLT3/iVyyRWmg
         D15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329456; x=1783934256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLNkro1xxZ0FVFkfbwOoV3dADIchfsZOcflVww3NZ6o=;
        b=oLpa3KiW3l5YEwBb5vYGJOBMxtqeK1PnD44fjb0Eg7yV7aOUyonILNreXkvfp3lPi+
         8TQc5iap0BLeNTiCwiJuJihOUyFDdFxZmDKxV2+Df4ZAAjIBHU6DTYPIRO++zdzvUdzw
         3gCtSgW5NxPVppMU+0USmXylD3Zj6ZaZdT75+h+7D1kiBEfQKl89nVOf9/HkeLZ4SSgS
         RlHFy8vKssNEJvWRxfMj1G2P4uIPpjNmcqjhp9B7Ej8dqEBDM4dL7Adpm87ItqRBQlgm
         yULDLgR80RsS+RKXJ9yeeqAvTt+w110YEFg9GFZTUybaeE2MMKPiiaLKwVptjuMYVMGT
         gfFQ==
X-Gm-Message-State: AOJu0YxcSC8f/oMIGLlhdclqNe7Gf/4dc0DXsYa74U2AbYwy/RvTpAwk
	nRvh75RLjtVAxgJmz6OChWQkb/nZN8u/8LNnMeBk9Iofu6deKI0sTGwEF1tCkBqsYXE=
X-Gm-Gg: AfdE7ckKkAxqu6pQFlOeONo2Mn4GdLtRZQEcFDA+kQzGUDD2sfwj6PI6rC38mHeKpD+
	7E/2NdF4NWvLrKKNPP8eziXbOPPhBpVjzhZoxJMWadPJmiYlLpPhqrxxOdHFfSPBg3Hf/2Tr3On
	H6/Iyt4SV9orpgvW7g4sPGUtb7HkRamYAAFJkYqv1MFlejRc979kmMIBTmViNhScYJG0ff2zXtM
	pf6WMkifaZU7S4Rj2FUxVUiqe1xUn4bsNVrBQTUTOoaTjd3Dlt/xgGPIJQXKHcHnO8rjp3VtIaR
	18Z1+O4bPmjGVKbUvP/86MBRhYRXdAK1NiUiV9autU8iDdwAcF7rbPkyESQEcyRgty+rrCEBR8p
	pL2PvQj9zqxN1559A49jTOTQWq7gl36D7JB4kWdQh1kDz2TdDMobnf8eLAse+scg1ZHuERm0SL6
	jhNr6EfKZ4ywMLpMJTJqQO0Gp9x6jRBMzkmwfIW5KPcq+MoMBYKrX4qOD+uz6T0SwwAQ==
X-Received: by 2002:a05:6000:1846:b0:473:cf28:a23d with SMTP id ffacd0b85a97d-47aa9c6ebbemr10691746f8f.25.1783329456532;
        Mon, 06 Jul 2026 02:17:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm22257884f8f.28.2026.07.06.02.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:17:36 -0700 (PDT)
Message-ID: <b0d4f87f-4222-45ac-9605-46427ea52fc4@suse.com>
Date: Mon, 6 Jul 2026 11:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/11] rust: usb: add synchronous bulk transfer
 support
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-2-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-2-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:

[..]
> +    /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
> +    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
> +        let mut actual: kernel::ffi::c_int = 0;
> +
> +        // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
> +        // stack or in `.rodata`, so copy it into a kmalloc'd bounce buffer.
> +        let mut buf = KVec::with_capacity(data.len(), GFP_KERNEL)?;
> +        buf.extend_from_slice(data, GFP_KERNEL)?;

And here is the GFP_KERNEL again. I am afraid I was not clear enough.
I am sorry for that. Let me explain again in great detail and clarity.

Let us assume that you have a device with two interfaces. One is storage
and the other one is driven by a driver written in Rust.

The storage driver experiences an error and runs the error handler.
Eventually the device will be reset. Now, after a reset the device state
will be gone. Both interfaces' drivers need to restore it to the state
the device had before the reset.

Presumably the driver written in Rust would like to use bulk_send()
to restore the device state. It is, however, running in post_reset()

Now you use GFP_KERNEL in post_reset().
Memory allocator wants to write out pages (after all we were already
writing out pages)
Memory allocator finds that an error handler is running. It needs to wait for it.
Error handler needs to wait for the reset (including post_reset() to be done)

We are deadlocked. You cannot just allocate memory in a USB driver. Ever.
You must export the gfp_t. Always. No exceptions.

	Regards
		Oliver

