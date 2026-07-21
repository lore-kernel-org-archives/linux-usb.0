Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F63EDAD8;
	Tue, 21 Jul 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628933; cv=none; b=hDMD23wwXWSaaOxddA6AcL3UCXtZaFhvoshRNguyi491uA81+1WLMRIXkYMALjvUtBL890i58a8VljQLijd9UE0mVkcLX5OorjmbIbaIab9PTYVm8nVVeJtPiliWEcql8I6E8rkctaEjL/KcFQaw+UTdW2HYgTvnzyg0ot4npi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628933; c=relaxed/simple;
	bh=C56lw7+cVCobPacL2iDKPJDqKKV5oDnBZJf1x5rGxZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=af881UhqEKDaouB1cQWJ+I9vSA1iLpZM3HuWhehzTvs7meV4VQ0NWB0x3JXYstHxgXhC09LlmC+6IkuL6VX3pnMSYBS8+P8ThKeXxT2DqOKG4EilmWx9ilj3NMFwxcI9oCATQlVMesTmENIRQtgxDeNyIry2oTaOO1xAG5yZLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LuGWizvd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jYhoNXr7; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LuGWizvd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jYhoNXr7"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3D52B140010D;
	Tue, 21 Jul 2026 06:15:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jul 2026 06:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1784628930; x=1784715330; bh=+m
	kW8ldB12/SPomdxcwYcA3LwI4sbSQv2CfMOt7z3ss=; b=LuGWizvdYU/eVJ+r83
	92noUdBnj7CAjkLV2Z2xzDsr6a8EXDUsTm0HY55Br/UFxl1N3CX6Q6KyE9d+LUI3
	CgI/Xh8FbhUj/PSU9C+aBY1W1znS2N8G3fmjg3mrei+cr+zSCUxiznaferNNI3Z3
	5Cjsj0WTFHoVeFQrdYb3eXxxov6Xt7PV+qXH/429hvpe3f8nFUHEi5XMc7asAHFq
	TqZi2NGCeNYUjLNX3NkZd0OuaXFGQckVm5aTj+//HamejL92fVgr+PPTW+8QwLzC
	3A69aPUWb/0d5WXBXfYBqoxCaNtjIB+VVC16CVvVL8tIDzGJ1KbvE2zvtS+coYlN
	1WPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784628930; x=1784715330; bh=+mkW8ldB12/SPomdxcwYcA3LwI4s
	bSQv2CfMOt7z3ss=; b=jYhoNXr7OYt07iNsbflC/XKvCqXCI2U62HgSjeY3QS9k
	wqXwA3SBAwT1xcEsb9roklZYxsZezdMTyBaF91N9ELsRaSck5wcLCpDbwKnp/YUz
	2ySjjRhfOhTfWtCzeoGMYQIksmXY1rPTVMEiUO3PUldaQr7uWuQvsgbeH1bGP9nU
	z7kg4+6LxdAQFwP2O63SuIosHqrZIoq2t5Wv/kMc8sEWgQsO4tY3kv7Gus/+ECv0
	sx9VbQ4nvUs6eM9+iwa1CZpZzk3gFRXpOjZL/m3Pdd+4nnb8W4xzgqufeZrRPErL
	RCIbNxeVWxgwnYVsBytw/hkXyHChokIojNQzWiNYQg==
X-ME-Sender: <xms:wkZfaiIdffRPJRKgkQ_VTCgOLPmifcHaXhJ2g_2YxlpU1LwYVLgrlA>
    <xme:wkZfajFNxtyXk0LAgbHoda8yFburtAv7jBYx65xejDv-TIoZ9tDpis7IQfxis5ynJ
    _x6gzdqmEj0Ji7isvrZdSI5Q4h1vP1gg9C4Qa5zQBAOrKS3wUY>
X-ME-Received: <xmr:wkZfauQrLicWmdX4BTzjpVKVQ1BWE6RuJCsWbhot0JCVgbQqblC0qE_2PPvQB4hSwp-r_etnhVeRQHtBDckMx8YwYKps2_b5Hg>
X-ME-Proxy-Cause: dmFkZTFhwCRHKebsYgLihL/RxbuCNDkx6MXJ1EM5G7gw3oWVSHC40vOhYx1VGQw0bgfepO
    zOm7qy0S1MjJB2jWAiTxct7zQIpuGQQ4+ZSOA42LQ4fJ2G0TQ0pvyQ1ed27I+m37FVp4a8
    cAaAaP0lWQS5SZ2xrHHKYqa7H94YDoR+qJdBSuKo8nvG5c730XVd3j4tIDZIgMhUcejtUI
    /O6g4AhffChmJphF9kl+Gx3+lKlmS7Tuke8eKJEY2kcJooyVB4970wpcCjhLbge7LFcOIL
    QkeGN1weY3aYx04vN7HlvLCuvtAbJNeT6VKfc+/jywF+dX5JL1vjpb+C23flcXfKPOFZcg
    SKEizsCrrR+du770IJfMGhtc3SNUI9Vw405HDsV2WR8JMnj6m5GgC1L5KQMs2YUQo3c8Mc
    rSKAXVjHjfTaQfA3Slp3arAWIyAUIQ2HQ/yZMnVWQ63nRb8bHDvOqs8nPI4ap5iltTaHkf
    o/T6LlfrbqltO434C4HN+J50LR0vivqPmoaac5cjeTRgNjTicDehICKBxYb/+3eRZYdBoE
    CfOutZ1S0qNlnfRK+9vKNYb70HxXo5qVwABagJ8LSIjZkMybynngqSSXWoD4rp2VRtRRZa
    gYzSrjoSmHUsYpviBIipbk6C7NWg3z7gvoqwvy6XlikU6oMsEgwR+RdZz5Ew
X-ME-Proxy: <xmx:wkZfanfJuE9TnPCN1CGRmJN1fUpRbglcHO8N7y8Uz5XqqxUJPtd72g>
    <xmx:wkZfaloMJis_vQsXopOt9vcc2fTqgZPuUCYLjrsAXLHhqXFRog0gdw>
    <xmx:wkZfag-OMeHSATikQ0l5rtC5kU6mkOjYawXhQeoF-QdOmRkjYnCWhw>
    <xmx:wkZfapfFBMYkc_sZ3tb_t3YUk0-MfB7Trzrg0Hj6pjz9oAnKSQx_LQ>
    <xmx:wkZfarF51_c73S58u6pkxJabNV4RIx58bj17MpiDYteFGpfIHVfWjP1E>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 06:15:29 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Subject: [PATCH v2 0/2] USB core hub error handling.
Date: Tue, 21 Jul 2026 12:15:18 +0200
Message-Id: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBAFf4Xs2RrakiKe/A9Dmrasthop6QLRk
 P67gHePk8ybtwBhCkhwLhZIOAcKsV9BHApw3vR3ZKFbGUQpVFnzik1ktYsJ9WBG55G0YEaibTp
 ua9sgrMMh4S289+i1/TFN9oFu3Eqb4QONMX3215lv3t+DmTPOKiEaI9XJKCkvzxSNP7r4gjbn/
 AWu3lKgxgAAAA==
X-Change-ID: 20260714-usb_core_patches_2-a3eb9d1b7b9e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784628928; l=885;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=C56lw7+cVCobPacL2iDKPJDqKKV5oDnBZJf1x5rGxZA=;
 b=Bm1/M9gll2TwGZ67fujsVjr14U5wNTi5X0Yj6JAze2IGzflm6Jdu44YNkP9p5HUkCD0W1cj29
 apmT2V4wewvBxALMVh3arWND2HTNK7rWAC28MiJDJxU4e8tt3XObHIT
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

A small patch series dedicated to strengthening error handling and
readability in drivers/usb/core/hub.c

Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
Changes in v2:
- Added a patch rearranging error handling logic.
- Link to v1: https://patch.msgid.link/20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Griffin Kroah-Hartman (2):
      usb: core: Strengthen error handling in hub_hub_status()
      usb: core: reformat error handling and messages

 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260714-usb_core_patches_2-a3eb9d1b7b9e

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

