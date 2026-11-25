Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629656;
	b=nwljCyLJAx0c2cdGRzOf/tglODITPgIXBzoSOdiqGL6N+UFILmso+GDiHMY+z2MmLvLc
	 h/UDltupzQp61dmahI3fbqLCsLlSwFVRtibuTjUaCyVuLVmcOirp237k0YapreDOGBXab
	 QZGAQB9hGJgKXncQfwzTrqx3bgmHcPR8bc4e3biPM8chJzkQzADH6VJAy6KG89ajjMDA6
	 DXeg4rbBig/kHfe8rExyIDia0zhhYLXsca4Z55Qnl/JPW+T98K/HtiaQrO/CfphMxKQ6c
	 UTe93QpxQ/wI9Jimy/lDCkYmlkVCQjwx2Brcp5gwiF3QCR1OgNMLAUCoo5O0wZL5Hzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
	b=n4btd0+sleBU/ppa1i0dNZN6qCmMXT37nxL8SmxvRyltyAdXG9L8fuRZvLXHTD25ADDb
	 a5aJ+FxQ7f9hRmOkplJnA7Bk4AW0Bk8r9bILnxHdP14cHHVU+NNNi08IjY8dVihdQyF2u
	 jmd3liUoiqHcuLBpRRW/lK0wESjXC/pt5AgnXGiAJe/Pv/EcuCLSDCiPadlTAGMMQSevH
	 rPdOOI4Qpbo78eYOJh2UoJhngVL5AiVDJKk4d2BoroVIE1SYv9Pl23tHW0eIbqLu69Rns
	 LqvdTx1NB/c0vTDSQZPpLsb5FX806/Xf10kPDovFVkrRxidmpf+/iO6kFuIUmZF5nyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BB606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 18:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5021722f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629654; x=1796234454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=fRD1AUsF9tDJYuYwbxPXkXtu9zWYe1dpFtJfe5CMETSrWtAvc7JRl9O38Gp3o9pp1t
         QbIbT2epeGAm5UWKqdTuGmzg+vfYvcc34ptXmjq1nLAZlxSoE+twsoTjgEqM2CHV8X92
         ErOHBP7xppVVaiIrTyUZ0OuVs4ClYR7gHoexH1JG2QVkw61I+agAq00XIMbhBEpk/ji3
         jzNL2XRFVuKQWvftdF+Vr0Ivz62I0vpcq7MELZzeGy9DZvI9Oa9b3oWsB/K4N7YX9Rdq
         F0hkUL5uv7spyKVe1rFn8YXeD68SNgPjeGBD4+gFaUEADGraUl4rw6AksglWABMDH9ha
         BhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629654; x=1796234454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=2ypE0jUOtRGSpfifICl3IZHKYMZ5N7vJdaUGEP7V2chHkpL3VrexGrIOm0Px7Wntnl
         TiHU1ixfRbi5bS9WLQpwILqJ8WxX5fC5b8TLXielETGo088ESYHVX2u5EmSVImp+13r2
         9N4uFmSOUsRJOif85DqOf6zx1zjI40LoJkt8foEUjgmOroZiwaZnA2zDbLM2mbgkW9yr
         oIVUwerP71XAY+FTrCiGxgfCFA/F7GKQ8iAPcj1WJaHC0K3ZQiNw/SpCIWKEaLdthYYS
         DotOjK9kN0RODHrsbRXmi0Jp0G8qUxmT2Wyuo/ZsZT7BJ23NXHtrDhgubiVvojUJZyiX
         CT+Q==
X-Forwarded-Encrypted: i=1; AL+hErHWxPUdbSAIC8fyeduSVUI//X5jMHmGmfwuuOrWGbXJBWzepzTDxNmCn+Mno0qbMWtSQeG+mMqu7EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xrDFKPxnySOFYwFGUawiA0r57ZEOn5N9cSP7DYKQrxG4ewI+7
	V5ClUwoKJrsDP6QqD7jhsS8Liomo1Up+gJFUj8psORgnZapRZf46D5kq
X-Gm-Gg: AZFdTZcHx/xykEdPJYucG0I4YvC+t+Ns1ZsPr8G7aXoZFknmQ0nQS62dU1yK0j8twrS
	/SCqwU2tzueIb5M/gufqyzX8sWE+uce6X7kazTQLhDyqK0/E6QNzaYtT9g7ka8z/HXtUNhbeZsP
	pkJKBVN5hIiuRfUMEzfU5oxS5YDDlMtm0EL8FQGsNqsfTmAiZb7bJNNz1QgwoSLWuhIBJKJfnar
	Nx5NukGFBWMb4oThC3yrNI7MCJ3Gpj4dDvyO13ECO4UpdP6w6Jshwy+lxQYcxIPrlWMBdhHWGNc
	tgaKabnecbbJD/SfZDmimPFtczuYfSazD9k1wrvprp2TgL69/xWSFoKH32s0KfEcL24c8Np6gpl
	H4j4OC53J03I7QK6CXIuQveWnRQFVRW5kqVtUGS0ruwlXC83b6llTM3eXw0EBgdQilbpflEbZn4
	v3K3K5ZS7ijp/3GbpEmmuqQpUAH38ccKd7+nkA+P2nVGyY7N/77xZQpF8oZWz59k9vOqd4qFj/Z
	1+1hehyk+seR4t5fWLNm9FQNDR9yNLxadIJ5MkzKQTCphFCCgtP/QvNz92KrvS1DV0h6pwwxk/6
	5cPpnFqOwNbdT58WNHTzc24WiwOZ4Gz0v7uY9WyNq9CxZJhdR4rjwc9TSvhRTygm+FRVf0Ger+C
	dwNIZuyUlXpc=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr393055345e9.29.1795629654223;
        Wed, 25 Nov 2026 10:00:54 -0800 (PST)
Received: from [192.168.0.69] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm759477515e9.13.2026.11.25.10.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:00:53 -0800 (PST)
Message-ID: <3d1cc139-77a0-49aa-86c8-a723cd29b992@gmail.com>
Date: Wed, 25 Nov 2026 18:00:52 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
 <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
 <20261125153300.GI191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125153300.GI191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Understood, thanks. I'll withdraw patch 1/2 and respin patch 2/2 
(atlantic) as a standalone single-patch submission to netdev. I'll also 
keep investigating the Linux-side runtime-PM gaps on this hardware 
separately — your pointer to runtime-idle S0ix was the correct direction 
regardless of whether a thunderbolt patch gets involved.

Thank you for the detailed review.


On 25/11/2026 15:33, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 03:16:26PM +0000, Tobias Heath wrote:
>> Mika,
>>
>> That's clarifying, thank you — I hadn't understood the two-paths
>> distinction. The behaviour I want on lid-close is Path 2 (runtime-idle S0ix
>> / Modern Standby), not Path 1 with the TB fabric preserved. My patch is a
>> workaround that patches Path 1 to behave like Path 2, rather than using Path
>> 2.
>>
>> On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD
>> counterpart of pmc_core) to confirm whether runtime S0ix is entered when the
>> system is idle, and whether any particular device is preventing it. If Path
>> 2 can be made to work on this hardware, the TB patch is probably not needed.
>> I'll drop it in that case and keep only the atlantic fix.
> Yea, it's not exactly trivial to get all the ingredients right but distros
> typically have all the drivers + firmwares shipped so that may be good
> starting point and just see what is missing (if anything).
>
>> Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch
>> atlantic submission, or leave the series open while I investigate?
> I would leave the TB patch out of it because in that shape it's not
> something I'm comfortably taking as is anyway.
