Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436772;
	b=H7MbD83X9YOmEWbP5pYdtFEIHDpgwjP5oEmUPWTh6Peg8Km6AkVGoOxUgo4pBy7Ujv1G
	 JVmvXteKuuE4Gga7iu7u2KN+zWdmX8xKxWFShowwqEqcpeMfQgXW/+S8nii88MIs9+rBC
	 JukLGFarGoN0Tz/j2QMNZ644lZB4tE2uIkCOLq8Z23FQLCCoU7TkUwV/c6aqYeXx02k7N
	 mC5IpaxORuMXC1cYZCU7ed2HYy8ScbhAblerlkiNHci5L2lojrODbOUkgibsrWox13GtJ
	 U/v+G5aAJBruN88Ps09RgFeV7bVYwqWUKLeuvqonjo4Cii29d5BPwtuKWAPCYrzk3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K17P0iX4e7B3zFL8vnCHFVMBflW7pbaf+lenu0Wl0AQ=;
	b=OFAZ7kG0IR3oaJRpPVNlg+qH8TkKRcjSnyggl+8LqJE52Qrcdoxi1kP2xQUPhv+IWW2G
	 r2QSWdyh3JQ2GzVvSkVg1kJUcypptiBVMLJ3LRLzQPqCWow5r0y3lcqQddNRwD5PfFmXp
	 Dj925BRD34f5IVq6Jq5fdYX2S+NqEJ6AzQwltaHVse1EnUi7jKAFRvg7qUR8gXaiweGCs
	 ojxJ9Ow/KXt/jJWe/w51/NpQ1w+41LK1/6JvSDfeX4oKnaVApmifssrMCaE3EsfmZMvq/
	 6zopo6S1qY9vVUkjen1J8nlNJvtvT9aD2pMnR8XXGJdjVl17z+O/0VOJ7BG1RXxTyiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dzptXhnH;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7CF606A329
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A7CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dzptXhnH
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-81b54d0cb17so1307498a34.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792436770; x=1793041570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K17P0iX4e7B3zFL8vnCHFVMBflW7pbaf+lenu0Wl0AQ=;
        b=dzptXhnHhtTBr2egznLXKGskGVaHlMTSRlsICyXeWmLAZKjgR0S+JaFQeD4x0hNlzl
         M9MQD/7Dewf4apvvbBsnZUzvochjpgE6ErgwmkqTLqSwRLHYMqxL0CwNImJe2+Tnyjhq
         OrdO+vyLiJKuVhyuYujFQQN7siRC1+SMVPlsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436770; x=1793041570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K17P0iX4e7B3zFL8vnCHFVMBflW7pbaf+lenu0Wl0AQ=;
        b=yBspI3JrxGcJiWIj8abRXr6kTf0NCxvMyAmiyR5MK6e5N8UAH6EIiLHe1ord6Klay1
         ygFnAyzeqAoGuYmvJUtcSa2uqP4ZnO68DsPGcOJ9+aSvhiVr1fFnIBaxtyaq4ooIpRIs
         8stn28+jr41Pm6qfgzgnPyFcB5EvN8TPQ/wMjF8DAGXmgMK0Qf7v7SvdDPqbrByDP4m8
         HfgeFGVxHcPkpeaZnbNPfRA13gsK7GLRkjNLQv5ByHQXkYOmFuepyHDlCGX9D9A699Oc
         UHmU9lg8RE4dfxJDXeXTM0XbXwusUaGRoK7Hw2VVbgV9AAsKCSKoUyPNSNPlbFmM+oMN
         LvKQ==
X-Forwarded-Encrypted: i=1; AKwUvBweCCX74IcxGtLh0EtMBjjKps+DWlHQJtI230uoiDaqqR0R3zuOFbYKSB4j41Yg0Oi0lDezAchnL9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnZR7NVpRhfizG1n/301WIC4y5GXAQ5zYFIbwAZcunh68PFAqS
	JEGWxwxeEstbu6kWar1npe1tFpg6JUQwTVhyo8LcFCi0m8amEjlVDaXuGz+y8Evr7yE=
X-Gm-Gg: AYBFou2Kqf49C/HTUJSR1hvJdDuBBgjaIA33wIEwLM0a5g9jT+0Mxn8984BbxmSQ+i/
	djYVHb2yJDheva00WkIsCRX18XUlmLa8HaZmwmGYykIb0jbbk7Wr4HdgmaeIK8P5+tmfHR78hQf
	52JtbYHoVFaG/PqBdbSTUZMZHPA525BCuomZpLHU4F48Y/+HRDIGhkJo7dDxlB+Rbb+gfjmXHUi
	K5BGu2+ZUPlkwuxLcFVl+DOeonLajd/JJ43rcmNHoQQJ8Vz12o95mEhReBSHE7zbIM4HnK/twJB
	9EB2iSmks78lzHiMyMG9Yr7xYZVZNhPNI9wXpmHwzJbGjor+kxxbFl9PLN0cbThKXlYVnO+Zgi1
	00lKlbDNANTEimFVfFfeAc//zCA42btFP9hdrG+tap6srDu0Is+9BuRL4R68aQdmoC2GcjlChXS
	1o2Dk03dM3knrH64GKEuCSDziISmwDFZP1U3JxxiEhsiCDd5miztevulMtGsxyE8jBsbWrqe4P6
	FhCfqWK
X-Received: by 2002:a05:6830:4407:b0:80c:d30f:97a with SMTP id 46e09a7af769-84500f5ae51mr9470270a34.27.1792436769896;
        Mon, 19 Oct 2026 12:06:09 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f15sm9615455a34.8.2026.10.19.12.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:06:08 -0700 (PDT)
Message-ID: <3237a1ae-c38c-4544-97c9-0dfaf0a0bc94@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:06:06 -0600
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
Subject: Re: [PATCH] usbip: vhci_hcd: store seqnums as u32 to fix lost unlinks
 after 2^31
To: Lucas Pascal <lucas.pascal@pqshield.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261019151537.112304-1-lucas.pascal@pqshield.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261019151537.112304-1-lucas.pascal@pqshield.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 09:15, Lucas Pascal wrote:
> vhci_hcd numbers every CMD_SUBMIT and CMD_UNLINK from a per-HCD atomic_t
> counter, and keeps the value in unsigned long fields of struct vhci_priv
> and struct vhci_unlink. On the wire, the seqnum is a __u32, and the peer
> echoes it back as such.
> 
> Once the counter passes INT_MAX, atomic_inc_return() returns a negative
> int, which is sign-extended when stored in an unsigned long on 64-bit.
> Commit 15b93f340fa6 ("usbip: Fix seqnum sign extension issue in
> vhci_tx_urb") fixed this for submitted URBs with a (u32) cast, but
> vhci_urb_dequeue() still stores the unlink seqnum without one. The
> CMD_UNLINK goes out with the correct, truncated 32-bit value, but when
> the RET_UNLINK comes back, dequeue_pending_unlink() compares the
> sign-extended value with the 32-bit one and never finds it:
> 
>    vhci_hcd: unlink->seqnum 18446744071562096407
>    vhci_hcd: cannot find the pending unlink 2147512087
> 
> The unlinked URB is then never given back. A task waiting for it in
> usb_kill_urb() blocks forever, typically with the device lock held by
> usbdev_do_ioctl(), and everything else touching that device (open,
> ioctl, driver binding, rmmod, reboot) piles up behind it in D state.
> Only a forced reboot recovers. On a machine importing a few FTDI-based
> JTAG adapters through a local usbip loopback, the counter crossed 2^31
> after about 30 days of uptime:
> 
>    INFO: task fpServer:2209312 blocked for more than 122 seconds.
>    Call Trace:
>     usb_kill_urb
>     usbdev_do_ioctl
>     usbdev_ioctl
> 
> The wire protocol uses 32-bit seqnums, so store them as u32 as well.
> The counter then wraps around modulo 2^32 consistently on both the
> submit and the unlink paths, instead of relying on a cast at each
> assignment. Adjust the format specifiers that printed these fields
> with %lu.
> 
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Lucas Pascal <lucas.pascal@pqshield.com>
> ---
> Hi,
> 
> A bit of context on this fix:
> 
> - We heavily use USB/IP on CI/CD runners, in order to have full
>    control/isolation for multiple USB development boards plugged into
>    a powered hub. So USB/IP host and client are on the same machine.
>    Once configured, a runner host stays up ad vitam.
> - I found the bug while debugging a runner host lockup on Ubuntu
>    7.0.0-31-generic, with an uptime > 1month. The log lines above are from
>    that machine.
> - The diagnosis, this patch and its changelog were prepared with the
>    help of an AI coding assistant (Claude Opus 5.5), then reviewed by me.
> - Build-tested on x86_64 and i386 with CONFIG_USBIP_DEBUG=y: no new
>    warnings (W=1 reports a pre-existing -Wformat-truncation in
>    vhci_sysfs.c, unrelated).
> - checkpatch.pl --strict: clean.
> - The patch was tested in QEMU (virtme-ng), not on the physical runner,
>    using dummy_hcd + g_zero in loopback mode (bulk IN read only complete
>    when unlinked), exported through a USB/IP loopback (bind + attach to
>    localhost), running usbtest test 11 (unlink reads, 3000 iterations), with
>    a test-only change starting vhci_hcd->seqnum at INT_MAX - 2000.
>    Without this patch: the first unlink past 2^31 is lost
>    ("unlink->seqnum 18446744071562067969", "cannot find the pending
>    unlink 2147483649"), and testusb hangs in D state.
>    With this patch: 5007 unlinks past 2^31, none lost, testusb passes.

Can you reproduce this with usbip_host and client exchanging messages?
have you noticed "seqnum max" messages in dmesg while you were running
tests?

thanks,
-- Shuah
