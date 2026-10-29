Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283586;
	b=NmXT7FBwMe+3SP3yz2vN38S6HLwhrMWAg917pAyMhPmF1SAEE57+f1QKWslTUrJgdeVa
	 rPbemd4ooXOCRkoadhj/B/DJVl5J9gcTQfnwHn77u16d5Y8HRsvrjQQAk65AurpS+QDke
	 kp6XZsNuM3KCWmK9YYnB3K0oOF9fpH5V+qifPrBj7xUhDasElu1b0X190L3q0JTXwAJDP
	 bnuhCpfp6Jm1G28FpgiIHvyk4PUuYJvmWT3/V9+hxEBgjKzhV4kgdanlLzpJzXiC3fAdM
	 75JB7eQef1D7Pb+LHxvKMuxsNy9LlfhTQ3/3HGpTQC5HyV4xiltaWX3PrC5f7Y0f8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
	b=tcthwoXsUB05JB0vavoUx63FHKTagP3boKPmytMPDkV7lOvb9JXR1KG6PUrY1xPaTEiK
	 px1H7dIIoBxePAXa0n04rASXFVi+HyhB+YvV2aWpCkS2ANZDK8UiU6CtxexEaPsxDQrlZ
	 PrvfNTaYyF75IEuilkjFxIUmmmEgLHAZp1EY5oy52MFtEzx9aZEyMNMfIgw8SASYLwvXg
	 KoZ25HIj47mp9Sco4CRfCvPIWWAQ7fL/RFexahAp02zwao7NMqY4taqYx7Pcli5oyzRoI
	 5vMV8ZALskMoxX0ABLKPWt8Nu+TaDp8Q/Mld52cBGPrpn7XbozGcWBCZKCGikIrDE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1Kc0cHJ;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FE606A91E
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B6FE606A91E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1Kc0cHJ
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-70b875f6f13so1635032eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283585; x=1793888385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
        b=a1Kc0cHJtPRYup/euD4+biOSX8uU7cpvQe/Zmj4pZkS8kOKVnHc/LBhJtSF9IDXojH
         tIQ44OLi6WdsFJoVPV4VJC7xpuuYRDQI5V9kI0uQy4+TdhyosnFYMyQN8GpALVaqgjRS
         FCezmaemZJLt8x+Sp8r02U8jlpmB1/P8oRXBrmIqm3pE1aL1QdxmXTqVICr3k0L4H3gm
         fvDu2xqgWi/a62Av8G0pkme0R/QxseUgJ9Y3aINr1E2Eml+YVJxMrKHjVKc7cGTV6b8/
         31TkOCMnhaWD1VzyWZCEwLAfkjN8x/94Ehg7aX4eCREIse56vKuUaA4dFr381rVEKi74
         xLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283585; x=1793888385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1W0bgqQx0WQwVtzmLATVwimU38bihjww459vZ9xeOE=;
        b=cTv5lM2aKQnpNBEsLzRJGeZjXyez+kuCylcJqYr3HSDjL+CBV6TTwcFqAWkv2h3xmz
         4aN5D7svKE7jkCtTqV5gVWCzMKU/pijE+JINJvYExI3hhJwIypZpYHJltiognRNLYj/Q
         F71Yvg92bAjC2EVoTHkCzinPuChtDSqNg4NaXO1a8pd70TM4nmx9f5mvps1Q9I73bD6M
         SFc4nvWR1QGvx55u9aa4JN6lrLAK+7sdF7eSQG463AOX1AFsiLuxLnFV3PBE0UlTmV9Q
         NQRKZzJqgoMgPvP1YR+iiKztBPnGEzhKeRBj0PElmsi2SxIdr0t21iZ9EhXeIP52MIPr
         gp4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/8Ss7AQPhHpx/m4NWpSoouhgP1gtPyUHdf5atbjv2kC9IB4Cqx/L7xoZ+Qma9YHw42PUKMVTfKsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvezc+7vll4dY3gwS8HKRGA9blb93oiR6xotpCvRkYE32kaN3X
	lqYqT1vHwBcP++gKCZS+gizmfyuNPiHOS2svPsYSK82+HL3qUhX9EE+ki2fSZUcD
X-Gm-Gg: AYBFou3XLWRTZVzSRlLoCnOt7dwGwIVIeNUWuZUJIYH80E4Se95GhO07xVVa3FZqzu4
	IE+OGacnMDZhY0GCJARhqNyNeF9QJ8T3APbPrIlM0GoBybKq0pHwqYaN4RDk+11LE2Kh6h4JPeA
	X1Phri9B6Kct8KVW5ekquRjyRKICztRwvhvGWySr72wvGYjdPKZ3C/YXeyFRwV6/wPBoaDkXh5K
	W6QmF9btS5nPDOchb6/BX57yCRkGZ+UDc82bsd5417IWiNJWLAMIKJQ/D2YeD3GCxFLkLv8sja0
	asKYUiPkSXnWFXHqs8MTtCTyt3qWlbFqv8i9+nv+Yz2SF8oZ7gI/xyjE1lk1Fiw6Hw/X08kUTdB
	pz1G9NHQV1/2Th2YilPjeUjVh6ZUxtbCcNivdlRWCdNriKe1eqBydGCUApDff7jXMmmxcoMym55
	68zTwgofq6L7/Hkc+X05yxJDe7cQC2o95hmgcbOyJ/I6Ndyr/nGp+Dwj5LfbErmUR/svE8GPUhx
	61QvPhjPfX4ghY4if9/NRJG8m4krmCaFsFWcnFW00yMQqgIp9g9uct5bQwRdd/pcFloWo4QzhQp
	Pqc4c/ITDCdMCYwVE7tpJuda1M6JYqRYP1DExSH6Juo0l1Ztp/MfuQ==
X-Received: by 2002:a05:701b:455b:10b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1a6cd77efe7mr6916673c88.16.1793283168700;
        Thu, 29 Oct 2026 07:12:48 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:12:47 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: fix over-reported actual_length in usbip/usbfs
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314073.648427.8311262845412746237@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The usbip vhci receive error path gives a failed URB back with the
peer-supplied actual_length, and usbfs copy_urb_data_to_user() trusts
that length for non-isochronous URBs.  A malicious usbip peer can make
usbfs read past the transfer buffer.

Patch 1 clears actual_length on the vhci receive failure path.  Patch 2
clamps the copied length to transfer_buffer_length in usbfs as a
defense-in-depth measure for any HCD that violates the actual_length
contract.

Cheng Yongkang (2):
  usbip: clear actual_length after a failed receive
  usb: usbfs: clamp the copied length to transfer_buffer_length

 drivers/usb/core/devio.c    | 7 +++++--
 drivers/usb/usbip/vhci_rx.c | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

