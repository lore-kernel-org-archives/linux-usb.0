Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167562;
	b=FbSC+pNtHmSK7RGVNPAScfumpHSXpFJOhxU8WhWl0N/D3iGcmuTMtBc4OX4wXN9RYKRu
	 fSFq+Ts9B3rZOoJ0j8GL4y+wznVRoI+8FuLY5a7sBNwStTQA/s4FK2/e9+V6eacdiwXN9
	 b9oIDN4P8hIEM0k/NpakshLdR2GslqI6z2GiXkWXP2Jp5SE2Ko0gXRtg8+SpSf93Lv9ht
	 y4nFji0ZUghmNb+U9uXyuztSSMqJ4nz4G9u/wRdU699Bk17T7nDZY1TwIUdqNNctpSnmr
	 B84MhiPpahZG7BVXHJGUafjSL792X3b2g5XmtN5/KBDFDyvCYlP2kTYCWmOas55Ghdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
	b=Qahjnx+BdwGE3vLqPX4QaGrX3JLVgzGv73hGgRa3XMjttO4UjZGIDmgrN9lHZwDHvu0T
	 LbUM4lRUr8ufLbrLrIx/axPGw109Sapm0csCTtfOfm6+ujC3A96YFw4G8LkisMRu9XHtm
	 P7HGn/4yIR5VlCk3VfhiT+Nhv2G0hrghIt2MBzemQ1CSTUjG8XFwxU4rHI61kEBSKspIm
	 wuJf9yQ7dcKzdTF/a0uKJn3ztmi0RCYwBbHY5iJidtLBp1gFXHHxZiw4QYnNdirASwjnM
	 LZeqgg058aqxQsE06DuD97fpWsFNfShOAISSKsfIq2UlZha2IxvrG/7Wzktej2V4zvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7bKuNcK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F9606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U7bKuNcK
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862a19300b7so269436a34.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167561; cv=none;
        d=google.com; s=arc-20260327;
        b=AVxP+sP/1EBNFALU/TyhO1inVJvqy4qHVIiZCO9YCEMnm9X1imoVvw4nc2j73VjlwD
         eqpuREC9BDlMjAZryexvpFV/nClGU2dbOX48yJ/lfCyU0cTnOoar9n7jeK+i3gWCU0K6
         j7nIMA8cQbvY+MDKknAJb7tAQeEY2UEYo5CsrUpZJibOxs+d3jQP6S3ahmfbl3AYWroJ
         9R++cjn2d+7/ZryQz3T8bGNwVaIx6jgzohRyonMTLOEH27P20JFboYUykTVYkGkR93TL
         PUrhLaR9Y1Q9xYPf++HgCCzZIsCjoR0F1K99kn8xN/bDej2hpNWfNllVDmVxmsgSo1wp
         u/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        fh=7VDofs7jiqptEnpTVUUCYnR8mY9EsnrPbvNN56HxwPk=;
        b=JLbMjNdf3F6GHu9KIIc/Sa1/mSPcTgjyQvMorGSkxLfLrh3U+wfAay2WEJFWNfmhp5
         vmtsHuN0axnteNK9kjed5Iduc9aWvcJr3JMIbu3VX1liOKw2auFMHpDFQOZ3CiZSD19x
         JYNAN3w9UYaFHDSAU8yUMw+UNDBWNWK46rDFNpkXihGnwiGcgMWIjjd9aYPbxeyKTGX3
         8A9yxp1prr89WJo72TQSpjAug0Zhri1+ZWEXeUbtknr6BSTKVGn6RgZMuLNvGUTEmxW7
         x702zVMbfYGxV4SOuJC2554PPKwcMacDek4UbWG0j1vcp3nUDjSBnrbNft/HOYaz1jWX
         BiNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167561; x=1795772361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        b=U7bKuNcKsonM4dTM4PWzPN53V7izwr60AW+KBokkq0AQoPiRz0lCMsaJJYgsazleMq
         Z2J9yzUzwJlO3cQ4Vau2apkc2t0dYpMsPqz1ntDTCVjG8i4+dbXNVXpFjb4m7BwtYl+t
         ph+7ESEAeQeT/7v//5Hk6OkkWJPKgKW/rznEcaG7K76NtMR6pq03VuMf4OlmhadDzCgW
         YiuSeGcCrPZo4VN9kj1tl1KYMWRiya49hRcimRhu6RH/gShpxy4SPaFm5xBEmgjF13Dg
         POAPGiyLlb42zSwy9iJSfA/iZF18t0MKPqT8dV14NybUctaoEI2zhW3GoY+bVIhI8ZWf
         pe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167561; x=1795772361;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BEAw+eFZcvRl43IB9+AAVp/qhU/BGg04lzJ5p+eG8r0=;
        b=NexfjQ7Nd4m3A+y7VsTQQ3XcvU9XfUyblfLS/cX1zsMOUSGUlAVQataUIBlT9H4e5r
         Ohu4ujlM4ls6n5plVp9NGifXmqV66ZKlJS9e3bwUcAHVWucXIQLnx09HRKfCPqAdk8wL
         TS0Rkt3iEf+8EbJd2XZI6FaseThskVT7dSNeZ/PJgwLuvPBCWn0FtFGeGJjETv1sYxMZ
         M1lG1PXn1AeKTRnRATi4Q8EEia7E1C8VlpcL9FHCWWy/4uZNzlA4awzZg6KB0ANU4b8m
         Y1DTqRxHOWwq55/WQc/cxoZ2ELlV6BOT79Sz3t6LWWQTQh9IYk0ZhUB05cSUjt5lPmmj
         cuRw==
X-Forwarded-Encrypted: i=1; AL+hErEfJD7O1WBQe2i7lXo3KpPS2vZrSXcgnJCSFTiy9sQ0ehTOepRXhB31Qj9nSg94SF3YLtKuIFi7VsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zcjiZbg5yhnHecL9osi9+r5tg97qZAyzx70qdkcCehYAofQ1N
	zlJgS6V/W0f/HJI/zRXVz2HIS1aVMl8c4EBr+yrzuugsiFA97kHobqyg5X9FwlFoyI8/2FNIbGY
	/ljTeN3fkpj1L5fkfxH0a33vbe3fE/u/TNgx9
X-Gm-Gg: AYBFou1p9eDLCR1nOMZKx0bpupTsNBReyM7kvHxetYt28Xt/+jHPEMe3a68m3Vveiwf
	c6BbAAY9QgJ+LrGR4XzCFD8H4ydTQ+b2zV0AeK+zUMwYh/yNkT4Y40UoOqSkLoyM6LuEKYsyM8H
	h6DQO7Ohru8voW3/8tCl5e2ZhD7/RryqmCmmFI6e8+f37swS6UA+PmV6A7jEd4pZC5d6vQywHFP
	luaQxOFH07Vx296bPyg1+M7mhHYolXpxEd606ev5aRTi/jaRP1bJeu0XDldu7DJ3lBR3H4oqXtl
	7lRVT4rFgJGQ1WSlcVv2n1Grlh1TBLV2ub++PfJVxyJjsYVoa5CZoXxiKL4opIanmQw53WDhXxk
	Cv5aRoqUEgTCMtLJuSproWwNuUhZXms5iczUxdjNhgjHxeebi1c3wq9fJTZjDxGoeD77kt+HZmH
	KxSnkA/RBdw4YndnI=
X-Received: by 2002:a05:6808:1908:b0:571:b166:3d76 with SMTP id
 5614622812f47-57a0ab2460amr3343180b6e.29.1795167561090; Fri, 20 Nov 2026
 01:39:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Fri, 20 Nov 2026 18:39:07 +0900
X-Gm-Features: AclHuK9ltT3zUqHytloj1JW7CdVlxNOQfyl-kfE2Ms_hNbPGLsz0aADkKXJ9yAg
Message-ID: <CA+m4KrAQZeEUL68dwJnVpO_ftJSS1ed86_XgnbW1g=EN=xKRcA@mail.gmail.com>
Subject: [RFC] phy: qcom: qmp-combo: Gaokun3 USB0 xHCI stops responding after
 USB3_ONLY transition
To: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Huawei MateBook E Go (Gaokun3, SC8280XP), I reproduced a USB0
xHCI controller hang after USB 2.0 storage had registered and the
QMP PHY switched from USB3DP to USB3_ONLY. Changing only the HS PHY
PLL supply reference changed the outcome in a time-matched test.

Both runs used the same local 7.3.4-gaokun3-touchtest1-pllmux1 image,
initramfs and command line. The stack is based on Linux 7.3.4 and
the Gaokun project's 7463df37160b device sources. The port was
a600000.usb, with QMP 88eb000.phy and HS PHY 88e5000.phy. Both DTBs
used L9D for QMP vdda-phy and L4D for QMP vdda-pll, and declared
mode-switch on the test QMP. The sole B/C change was vdda-pll-supply
on the HS PHY, from L6D to L9D.

I booted with AC connected and the test device unplugged. I attached
the same Patriot storage device (13fe:5200), Type-C adapter and USB
2.0 extension in the same orientation, without a DP display. First
480 Mbps enumeration was at 600.413 s in B and 602.532 s in C.
Both runs logged the same QMP mode transition.

B (HS PLL on L6D):
  601.750124  SCSI disk registered
  602.372963  QMP switched from USB3DP to USB3_ONLY
  640.995390  xHCI host not responding to stop endpoint command
  640.996749  HC died; cleaning up

The controller reported HC died 39.247 s after disk registration.
The USB device was still absent at the 114.85 s check.

C (HS PLL on L9D): no Stop Endpoint timeout or HC died in this run.
The first connection dropped 88.300 s after disk registration with
the cable still in place. The port started re-enumerating 0.336 s
later. After the disk returned, it stayed attached at 480 Mbps for
90.092 s and completed a 32 KiB direct read. An earlier L6D run with
attachment around 68 s after boot also passed the 90 s/read test.

The L9D use count before attachment was 1 in B and 2 in C. With L9D
shared, the HS PLL and QMP PHY each held one reference. In a separate
instrumented build with L6D assigned to the HS PLL, I captured RPMh
disable/enable requests to L9D (0x41104) during the transition before
the next bulk OUT stopped completing. The matched B/C runs did not
trace RPMh at the transition or measure rail voltage.

The mainline Gaokun DTS already shares L9D and leaves mode-switch
unset on this QMP node. Stock mainline reproduction is untested.
The one-line alignment for the downstream DTS is here:
https://github.com/right-0903/linux-gaokun/pull/9

For the next trace I would like to correlate the L9D RPMh requests
with the last xHCI completion. Is there a QMP or DWC3 status register
you would sample across USB3DP -> USB3_ONLY to distinguish a supply
interruption from a PIPE clock or PCS reset?

Thanks
