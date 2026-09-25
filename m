Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE317B425
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 02:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790301794; cv=none; b=nfIg1kTyQ6JZcllSqkIFV3rccB4kzeESIC8R5VfeQX9s9hKp5T2K7itQNFp6fUtl3Lz7+LH/qy42CRQ/+LsSBfPObwB2dsBd+Wpal3WeSQpQFnLpE9Pjeb5NVdYagZ6vkLB7IcJu5Nrf2MRnrakiR7dEA7GKmk+fzO/kpDlLew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790301794; c=relaxed/simple;
	bh=5tSv8WEXDmhxXuj7sx2k8U2/4lYfbfwpJHxYR2bf7hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJHvpa0J0qFlEcDQ5wmebk7LsCMndjNWxZKi6CUKMRQRHdmg7d1KRIa+MtFEwwJ1WsdYFkhjzLq2sEgRmuWOoJbxpZ2waIOVhFOzeGnO+nPey2blRnMuamxvd/5xlGZZXszH4MlLIX49TiiawO8b/k6b/C6990gkdch3+k5mZq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GstgHjEh; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GstgHjEh"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142e0b0668so4956456d6.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 19:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790301792; x=1790906592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gT7cwoS8k3kEIWqKd7SZ1DebMDzkHiM+DtBuYnpTJK8=;
        b=GstgHjEhSp7muS9/AHYTVcQPAza8thvBPC5q3JMXWgK7Q3LtEcVS0cKupcu8lJ8SK3
         lj4OEuhzpT6iJiFI/sTo/iYLR+l/BjlXl4MfDlkPGDQerMxJQPQs2iVBg+VLNlnyYswP
         0E8Qvikmv6DkO+r3nAeFr4pZLQbx5Q55Brhlmy4mE3QVwapYEx3YCKGGuSLenGWFMU75
         0wegFI7FjkYkXQXLPl13MoAMQJdePYMiIe7kmGoU2HixaYZ+gVr7PMILSgH9NT26lZpQ
         n07mUFWud5SWSZR9KKtRxF8s7KfsOpIIpMq76ODVvyH2hTwwScG+8Lnsv0k/oguFMJ0O
         uzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790301792; x=1790906592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT7cwoS8k3kEIWqKd7SZ1DebMDzkHiM+DtBuYnpTJK8=;
        b=YNvkbrio6czgpT3J1rabS/G7HygyPbu1MI8SRCSAnSlHkJxuyD+gBi5WbZMS0T3XKR
         0OIWh2La0U0irp+2C2ZeR/LxVazwE8Mheb5qORwkpjzq/plwQh8v8pB9do5c+Q8/WXAx
         1W5YmVNrh0cHEwVyn3n0kKuUgUByDZepmLMgEA0wwjrq34XLflgTDM9tRSWXaJLzc5lt
         P3j+uKLZPNBYCn4O9MmhG65DXvcjJMjH82NGaBVV8veF54tGDT25liJOauBytRpfRhNO
         Zd/h9+mPF0UmoZwKS1+RNEqluseZx3c9lHCiP/RIe8GGSk083coT5UWh03i/s5973em9
         dYxQ==
X-Gm-Message-State: AFuF++lSsbfhi6lwiurcQDm5dkspSxFiykLp8q6ZNVITfl7S2n64eQss
	bssGyXA3kCQkb1zCUr5QY+buouJb7QiRVMswj9IlMliQbmFmTzZoGqRUYsIv5/DxV+aGtOWNR6Q
	7BLHO4w==
X-Gm-Gg: AYBFou1TPNo8XDPBFZ7CYlb9vfDvhb21AGWBeM/Or1TtGpb6fPs+TV8J4qo23D28M1s
	/uCSqO8yWsY2V5UPWyX503KEy0Im5nVKuYEp10h2mJZqvMa0YRYU9MM7kqY1OOhKzmmiUOu76m4
	QIBdWSchqdRjYK2XIEIGYkoyH5bPfTL/yzCGb4qmVs6JITxZqRlW2DzcDxw0lTTzEzKeMyV5FjF
	gA3FwqL+TawrStA8IBzXdPg/aBRl0gIjjRgzEMTi2I3vM+fklN5uRRxTd6XLOtVT2lUUoxA+WD/
	uoZw2GCYeX1ZKE+1O2JCZ81QFZYWGDWABxjk0D0GUt8i4JnfkEiauVGOT2heKBoKSbfWEEwqafx
	KzWf7IIi8/YFl848omoe+9e0h/UKnQDmAcRqgSROh1SbKezRCChrB9HPWCla+0pgUeArTF7zIzO
	jBxdwl5l11noxFQri7vQe85FZHWx5UwqrWEyBVXdw7qbGJfR2DRHWXyAGSayiXM2aivlfm6Ym0Q
	cLFNr4mJA==
X-Received: by 2002:a05:6214:3b87:b0:914:2d3a:a652 with SMTP id 6a1803df08f44-9142f8fe985mr19674006d6.36.1790301792106;
        Thu, 24 Sep 2026 19:03:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e6ccfcsm6499636d6.40.2026.09.24.19.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:03:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:03:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>

On Thu, Sep 24, 2026 at 07:53:21PM +0200, Johann Klammer wrote:
> 
> 
> On 9/24/26 7:30 PM, Johann Klammer wrote:
> > Sorry. is a different box. will edit modprobe.conf and regenerate..
> 
> This is with uw quirks 4.9.210 kernel, filtered by device 2:003.
> The error message about the cache when unplugging is gone.

> > dbf07000 396249647 S Co:2:003:0 s 00 09 0001 0000 0000 0
> > dbf07000 396249808 C Co:2:003:0 0 0
> > dc2817a0 397280030 S Ci:2:003:0 s a1 fe 0000 0000 0001 1 <
> > dc2817a0 397284164 C Ci:2:003:0 0 1 = 00
> > dc2817a0 397284506 S Bo:2:003:2 -115 31 = 55534243 01000000 24000000 80000612 00000024 00000000 00000000 000000
> > dc2817a0 397284649 C Bo:2:003:2 0 31 >
> > df734900 397284663 S Bi:2:003:1 -115 36 <
> > df734900 397284768 C Bi:2:003:1 0 36 = 00000612 5f002000 53656167 61746520 45787061 6e73696f 6e205357 20202020
> > dc2817a0 397284778 S Bi:2:003:1 -115 13 <
> > dc2817a0 397284892 C Bi:2:003:1 0 13 = 55534253 01000000 00000000 00

36-byte INQUIRY, successful.

> > dc2817a0 397287747 S Bo:2:003:2 -115 31 = 55534243 02000000 00000000 00000600 00000000 00000000 00000000 000000
> > dc2817a0 397287910 C Bo:2:003:2 0 31 >
> > dc2817a0 397287937 S Bi:2:003:1 -115 13 <
> > dc2817a0 399105730 C Bi:2:003:1 0 13 = 55534253 02000000 00000000 01
> > dc2817a0 399105844 S Bo:2:003:2 -115 31 = 55534243 03000000 60000000 80000603 00000060 00000000 00000000 000000
> > dc2817a0 399105957 C Bo:2:003:2 0 31 >
> > df734240 399105970 S Bi:2:003:1 -115 96 <
> > df734240 399106084 C Bi:2:003:1 -121 18 = 70000200 0000000a 00000000 04010000 0000
> > dc2817a0 399106094 S Bi:2:003:1 -115 13 <
> > dc2817a0 399106456 C Bi:2:003:1 -32 0
> > dc2817a0 399106465 S Co:2:003:0 s 02 01 0000 0081 0000 0
> > dc2817a0 399106584 C Co:2:003:0 0 0
> > dc2817a0 399106595 S Bi:2:003:1 -115 13 <
> > dc2817a0 399106831 C Bi:2:003:1 0 13 = 55534253 03000000 4e000000 00

TEST UNIT READY, failed with the same error codes as before.

> > dc2817a0 399106908 S Bo:2:003:2 -115 31 = 55534243 04000000 00000000 00000600 00000000 00000000 00000000 000000
> > dc2817a0 399106957 C Bo:2:003:2 0 31 >
> > dc2817a0 399106964 S Bi:2:003:1 -115 13 <
> > dc2817a0 399150206 C Bi:2:003:1 0 13 = 55534253 04000000 00000000 00

TEST UNIT READY, successful.

The big difference is that in this trace, the kernel asks for the
regular 36-byte INQUIRY information but then does not ask for the
complete 100-byte INQUIRY information.  Instead it goes directly to
TEST UNIT READY, which fails with the same NOT READY status as in the
previous trace.  But then the second TEST UNIT READY succeeds.

Maybe the drive doesn't like the 100-byte INQUIRY, even though it
claims to support it.  You can test this by doing (as root):

	echo 'Seagate:Expansion SW:1024' >/proc/scsi/device_info

before you plug in the drive.  That should suppress the 100-byte
INQUIRY command.

Alan Stern
