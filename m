Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167337;
	b=psnQ+VuYOlGfMUDr0fiGXkyabcucOsXigWb57vZxqPxuDaw19g6Gg4ILi+ubAf7zrNvG
	 cin8r8K/icPB0OoCAow5x+YWmMODfbnIxxFUdAAUvyTdHjnu2YdcCoO4KnpPs73XmDhfG
	 Ojp9TpXYrBpAFEgCKhty6HUhJrvElDVi9RcT8MzkOJFO1wN2q+A+NvjRZqgoYpllvHfD2
	 QuLy5zdHy5RhlYoLBS8u5Vx+9jlxmHZRdf7tZePGZslK17ZTWFTQBglFCfqzWMoCHz+vW
	 dV4zoj1ma0KzZYTA9Zw0X/z5us3w1n0d8ru3SiA+efiPxyMJsN4+6oavU063sRniX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
	bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
	b=l2R6sTvlx2dG9XcO4GvxhdZLYzb17jzhkRjtO/QYjDc2ScogtS/rzKpUNexxik0/rE7U
	 S5Dy1aT5u2oUGIfh3/qodXau01CH4J4YE1fJr2cq61EkMMhuOvPR78PGJWxdvFG0a5htU
	 kn4wG9cpquoo4xmjkici4YKyT1V8rFzqqoV/JQlH6sfkyjeq4t32XhvtS3DXnmeX4AKIZ
	 Tm7im/yMC3BdIQy4/hmAT710mueIj3q+vrd9L1V7VsZlZgWQbqZ5Ug3XQoSn3qOqILuc+
	 lY2xr6QfSenYU18wRtGxTPXffzb7RiLRHPeqfVAUmmuLGohZmCuV5XJZ7iP5x7ebGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXyBRKdJ;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66659606A320
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 19:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66659606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXyBRKdJ
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso3196886d6.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 11:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794167330; x=1794772130; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
        b=jXyBRKdJkp6XXvNTVIP2mXjuKPdYX1DWsFl9pcjjUplrb32KrShGQams2/5jR6g9B/
         iYuUFgoWKkSRHJlK9aABS/6k7CON3OhlRylQDZKvG5/GpLNAR5DoaH+ndUFPLzWHJCRG
         aFvjcLhjmVEuIN2jkZXDiOK4BcFmxQVMhg98YqvRxcr45aW2dKpfHNPel5FVskOaqbYv
         YGaPgrqrJM0fwl9k0MPvARz5ufMpydgf3kzHR1o0HdAV6jq579EcNHP+dDBmlYuRqqae
         XgbHIsBg3FoK7GzT/bLE35d0fYOeDUpzlcVKEcGgxPfhyT1F3gYnyiTUwZlaRXpXHBte
         KU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167330; x=1794772130;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=70zQaTidZegJHL8BTv/OZYMfTi+NPOAhkseasQT6l4c=;
        b=If6imk7CWJm34v+jrfgXN+YG4/OJkztKW5GYqrv+lWrv1UMM3B42oR58OLm7NM0DC9
         q1FYViVO8u40fTQgfgu4SBqZkZCbZARRFlDSoTNjjHEaaCnq0WGmJwcErLz9pU/XIlwQ
         AU7LGBvWk7y5xe4sKCMAV/ri9ezy0sfD1Ty0FAs4QmkpvCkTXnWhzLKasiiQiCBEQ64C
         AmA+Z30Na1Q3SwJJUfjaE8ZUsWexzdDjZYW/Tkgpd854jAeu4JNE3z+biaNkBBEagILD
         pEuKrUcKv4W1DbdH3KBUtmPRC32sDQ9c5fz2/Z0Ute1I1X45jwoP2qBGSG4M1Zn5Dw0f
         QBFw==
X-Forwarded-Encrypted: i=1; AL+hErFqI31/Hu2iTGecZpETpVFP6oY/57gXtOViM2l10QVVLF7ny9wSDRqQHnrZ4Yj35SF0znpy/5is78c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u/8JeCLrDLm3rsOHzfLlrdnnRVQ2SwEoULhK26RpwUCSF+Eh1
	1F93Sphl5hhNycee7KdRywAmhNclUHOzCfe+toJmR3W1FCRBty7hUBZk
X-Gm-Gg: AYBFou1+CjWzrXTYC7YuKdkRHT4lZPjxo8I0YtpQj3/Y0Kb76OUIDHOl6q6q3yzR2WT
	dLo5p2+IRQwvak2vG3uReDNJacq3Ct2USgFJNOqtGKwg4OI7yz2FFIFJHISN6MWrjyDwe9GuT/C
	1jN6vN78F8cgNk8uOh/qeWC1lfJQkYLtvJhV9BdxlU4nrUG23V2Lj6zpE3mHQwxS4u1vI16h+Do
	3WKlD8K2KQLoNWVF4+EWpt1HFtJJGaWbWYl+Wh25sNjEJk4DaBR5Q1kSsD1DW7fX4r1ahmedrNB
	p4OHRga5mLvvaiN4vPKFipA5s0nzImuiQbOFIlnO1hOL12aD9bqKyCSWi9QTlqUgY4PFW4TxyKF
	sorh6Y0LvlhGAjWx+J7gvAZNnJM7bFvAvl8L4nS+2MZVxdMp0KcAVAmR7b9Q0vhArZXtPdMfMKe
	6mOIIKbhtj4qDN5KgDaFTzKafbAhbD+KsVTIOIDou8oqSCZiKVLhswruyU78K2ZEeZArIdimoZl
	tlJMxX9Ad5m6SSbOGr9Qv5k5SjPXtva6I3wNGYCHCu0b1V9H/wGkpjj7v4GMBdP2vD8rUDvBeTV
	nlfvvlPgMQR1M64aRVMbYMOgxZa4b1MM9ZZNgampGxya+3OuSemK7lVu10I0TvpqD5vX
X-Received: by 2002:ad4:5745:0:b0:91e:76a7:187 with SMTP id 6a1803df08f44-91ed24acfe1mr32302126d6.43.1794167330178;
        Sun, 08 Nov 2026 11:48:50 -0800 (PST)
Received: from Desktop ([186.247.175.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eced95d39sm25058076d6.13.2026.11.08.11.48.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 11:48:49 -0800 (PST)
From: <brianrobertjames@gmail.com>
To: <westeri@kernel.org>,
	<YehezkelShB@gmail.com>
Cc: <netdev@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: thunderbolt_net: GRO header-length ordering defect on Proxmox 7.0.14
Date: Sun, 8 Nov 2026 14:48:48 -0500
Message-ID: <000201dd6fba$2c726e80$85574b80$@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1vuZ0ajLhI60pVTHeHwa3vcNZzXQ==
Content-Language: en-us

Hello Mika and Yehezkel,

I would appreciate your assessment of a thunderbolt_net GRO ordering defect
observed on a direct USB4 link between two AMD Proxmox hosts. We have
receiver-only original/corrected/original comparisons and packet-order
traces supporting the Ethernet-header/headroom correction already published
by Shun Li.

Credit for that prior published correction belongs to Shun Li:
https://github.com/riverscn/thunderbolt-net-dkms/commit/b18a196bb5ca54246443
e1a29924d6007aa16036 

We independently investigated the same defect and applied the minimal change
to pinned official Proxmox source. We did not install the project's broader
DKMS/RX-normalization modifications.

Tested environment:
- Two AMD x86-64 hosts with one direct USB4 cable; native thunderbolt0
traffic, no bridge, VM or Ceph in the path.
- Receiver kernel 7.0.14-28-pve, #2 SMP PREEMPT_DYNAMIC PMX 7.0.14-28
(2026-11-02T11:54Z). Also reproduced historically on 7.0.2-6-pve.
- MTU 9000; TSO/GSO/GRO enabled; gso_max_size=65536; unpaced single-stream
IPv4 TCP iperf3.
- Stock thunderbolt controller driver unchanged. Receiver comparisons
changed only the network module's header/headroom metadata. Cable, ports,
offloads and CPU/IRQ placement stayed constant within each comparison.
Secure Boot remained enabled with signed test modules.

Receiver-only comparison, original -> corrected -> original, 20 seconds per
arm:
  Original:          30.599221 Gb/s, 620 TCP retransmissions
  GRO corrected:     29.779541 Gb/s,   0 TCP retransmissions
  Original restored: 29.994158 Gb/s, 540 TCP retransmissions

Endpoint interface error/drop increments and receiver FQ drops were zero in
all three arms. The unchanged sender in this historical receiver-isolation
test was still on 7.0.2-6-pve with TX E2E enabled; receiver RX flags stayed
FRAME|E2E (6). Both hosts now remain on 7.0.14-28-pve. This is not a
two-latest-kernel GRO-only comparison.

Minimal reproduction outline: establish direct USB4 IP connectivity with the
above settings, run an iperf3 server bound to the receiver's USB4 address,
and run one 20-second TCP stream from the peer:
  receiver: iperf3 -s -B <receiver-USB4-IP>
  sender: iperf3 -c <receiver-USB4-IP> -B <sender-USB4-IP> -P 1 -t 20 -J
Repeat after changing only the receiver's header/headroom line, then restore
the original receiver module and repeat. Module reload interrupts the data
link; our management connection was separate.

Mechanism and minimal correction in tbnet_probe():
- dev->hard_header_len += sizeof(struct thunderbolt_ip_frame_header);
+ dev->needed_headroom = sizeof(struct thunderbolt_ip_frame_header);

The 12-byte transport header is not part of the Ethernet MAC header
presented to eth_type_trans()/GRO. The original hard_header_len is 26 rather
than ETH_HLEN (14), so gro_list_prepare() can compare 12 IP-header bytes as
link-layer bytes and fail to recognize packets belonging to the same flow.
Runtime tracing confirmed original hard_header_len/needed_headroom=26/0
versus corrected 14/12.

Historical paired receive hooks on 7.0.2 covered the same 18,871,120,863 TCP
payload bytes and 303,590 packets before GRO and at TCP ingress, on the same
CPU. Forward sequence gaps were 0 before GRO and 1,219 at TCP ingress, with
no packet-length parsing mismatches. A corrected capture had equal byte
coverage and zero forward gaps. Retransmitted/overlapping sequence ranges
were treated separately. This localizes the observed ordering defect to the
receive software path; it is not proof of physical USB4 packet loss.

Full reproduction details, source provenance and the one-line patch:
https://bugzilla.proxmox.com/show_bug.cgi?id=8306 

Independent hardware validation shared with the prior fix's author:
https://github.com/riverscn/thunderbolt-net-dkms/issues/27 

Separate context: with both hosts on 7.0.14-28-pve and GRO already
corrected, we also observed TX-credit-dependent fragment-validation errors.
A local negotiated TX E2E opt-in gave 18,604 -> 1 -> 18,601 TCP
retransmissions in off/on/off 20-second arms. This is a separate diagnostic
change, excluded from the GRO patch. Its lower-level cause is unresolved; we
are not proposing globally re-enabling TX E2E given the known controller
compatibility concerns. The related discussion and limitations are here:
https://github.com/hellas-ai/thunderbolt-ibverbs/pull/78#issuecomment-672616
9650 

We have not reproduced these observations on the latest vanilla mainline
kernel, and upstream acceptance of Shun Li's GRO correction has not been
verified. Could you assess whether the GRO correction is appropriate for
upstream/backporting, or point us to an existing fix or discussion? Raw
benchmark and trace evidence is retained locally.

AI assistance disclosure: source review, diagnostic automation, analysis and
preparation of this email were AI-assisted using OpenAI Codex (GPT-6 model
family; a more specific serving-model identifier was not provided).
Measurements came from actual hosts and are not simulated results.

Thank you,
Brian James

