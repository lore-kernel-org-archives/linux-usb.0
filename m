Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634197;
	b=D2oYbqicJDeM+E3Dz0zbtRWzc9okn6xUDWDuEFGGyIAjhWV1KUV6ze1/57zCEwteZ3r/
	 PitBAy0x9xdsDjfQCxjlVHfif7SLdB9uadoVIcvuEwUintnES/av6Xf9osWm5r3xDk3OW
	 /i/+NRLlsTdpWzG+OpcCJzvlaqlYl3gGTLeDF7NJpleTBd72Bn3bWo6dO6EJRlcyUGrta
	 vKNJhFucyTRY8voeV4EfNrzKGMpZtuK7LjLP2OWNuNDAU/O2QfyJmPO8qktLXMVQUwtL9
	 eazDPUgz7wPPRR9OSYNWgYvfmHc6xU1/P5PrQSr4tIsI4F1pR6oGj2euPI7NJDwjkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
	b=QAnNwhy2SrXxpo/pW5VHCKt/17HIh9pdxgU5O7jJ3gm9R/LABCU+xU7cKGU+rmYD81gN
	 MIu2lX5hjoboXsvIG99oYKqU8Pa3vLaI01ri5/vuJB7/Wl8rkvprQMVULYUQS+sHkxYhT
	 16uf8b56NoeJXxlUfJrgvKocuIF6Q9X7egFwgfMJU2/SC8wvo5mfJXnhKPj4A6kt05hGD
	 eE+3b3bghBOXu9kT2s2b7d3pQNHu1wCbZJ8czudni3uuZd5dppSccaRLGWYF57KIz8m0w
	 NVnCMvbrfCShkQRlrL0+zz6myQRDURgw6apOXf0/aeDJLaR2b4BOWXoo7isKp8E01Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9QUns8L;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3F606A335
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E3F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9QUns8L
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed08b07213so9419355ad.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634195; x=1795238995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
        b=x9QUns8LygYER6rS+zrUErCDxfCuEzZFMjnJYYstTzqa3hPY+e5AWl2n9ZIT5whLpI
         cOsh6wCFXx6xDsVpJoouiu66DQsZvc0ffkRkgD8j7QjIwIDH4HAj6CcC7nCcc/T828Rg
         euxQf0MBKZy4HOIrktd6BIVikqb+9rjXvI4JfwfmzX5QY6jftYNmYrewD13mlko7rGc5
         N8czpTaHHxKJy1unoOYXFz43QkPFOOSqSfFUswQmO8jvYOkTfCQSSW8QxMos1cOgCtMK
         S5OYfp3xRXCI1TP6hFIYS4+D2Rns9yUshBVSOPXpn1rxXk8pC3LbFU6auUhS2n5iRojz
         5kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634195; x=1795238995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bMIC1kskP5GdqBrbGoext4Aqt+LqpqVvPyut75h6qnQ=;
        b=QTw6sdAOJly4WG8WaBval9TMcer3Lywlm21Qy1F4DxZXJoAzXAgOawLM7ghHTk3idg
         t4fuHWBolJnFzWy7B7WlsoKg/2N9Cq4cN9qB6A1qUg/KMcLfZL5WttQ+L2CYtrLXvABc
         Cf5vVwhKnaKVms/T5Z/RyqppbLNuJfdaSwt8/jiSGvgGVkCscLXHu3oKG6+pxDsXv2Lh
         tFNJ9a0H6Klj8W4BglWpyUmYwBjjhEAGnob0WnmZX37xplNqMRMeKn+JLuCfCHriVJY8
         aU6RMcxixOdddUw2qbV6gpw3Sn6774/7LLXpjexm/JPjyvTFgV5FD+tfVjbltO19d6iw
         JCPg==
X-Forwarded-Encrypted: i=1; AL+hErFX1jlyyaitDpK2ZJiwQqnvgihtTacOkyxlKtfqXjHoWfSqpPxWnMQCEIYKKyDdb8bJA1RiEFnxwkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SexQ1AjsTm8qgiJmjB5oojtTdCc5ljRtbggL2n0EnkfU7dwqC
	0MFIT+6E2xyRa3EcL6uk2a7fA+roWpJNyZcs9AOvtxPIbOUIb/8+JsG+
X-Gm-Gg: AYBFou0NxvrKFCyFxD3H0l6Rsk/mwL5YHIIChbkzaZYxL54vZ0okvhtVKq9vScdUJK4
	wyewnMLP6LTJhFcTGxNkmN6dbZkQS47yiDGw2UHsBSaAPqS38Sq7xMzKZS29JSOR6DeXaJ69y4k
	dkexHsytTBnaNfK6fsWWJdqdpmhoqsfkAliDXJWxe9946MjJunqqdiAxUwpTU8ZXLXGz0SQK6KE
	fQqmYNTQsNUcL0+5J1t5G0l+Q/GQ6rTbKMsipXD1dWE7pSsN3agjjVysIWxX8wZsiuOGlXBasHB
	+DoegsFLdE/l7oC8j8m1K8suXyTcy4NzbgI4Ca4LUIoe+rigCuea7ru4zGXVd7+mlU8K9upgRGs
	C1kRwM5EOKARyk8cvwV0OTlitsLPduJ/+naTWhvkKTrcjkpfucWruuXOc+RnzMpoaDAJNGbSf7Y
	ZP/eIHG6bgCSthTxqaIMcPMHL6+LVsMY9/AbB+UzrCOFT3SqvVjXfKjCICKlWIrccbPds4tExTW
	ZtqZlZwXvDxxqGBPVHNtswLL5Dp6pqwqbHm8ix61+gxf4LC2Pp0R+BXU1Iyn3SjpJUHMqWqXLai
	3pF0JgK6KD5n3V50pn/jCSbZfU8cneGo40ormbTDpgt687f4QLEib46tSQuZutkTblilal+XDej
	9eWbypyH7VkLsfi3I8lgoVuYP8+UeYSXI/H6OjHFBAQgNXAa2IvOj43Q=
X-Received: by 2002:a17:902:ccc7:b0:2e9:6c15:6b2f with SMTP id d9443c01a7336-2ee0dc93a16mr44755005ad.25.1794634195250;
        Fri, 13 Nov 2026 21:29:55 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:29:54 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Subject: [PATCH v2 0/2] configfs: fix use-after-free races in
 configfs_symlink()
Date: Sat, 14 Nov 2026 13:29:45 +0800
Message-Id: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/4WNSw6CMBRFt0Le2BpLSv2M3Idh0C88hdb0AZEQ9
 m7BBZg7Osm99yxALqEjuBULJDchYQwZykMBplWhcQxtZihPpeScC2Zi8Nh4YjT3HYYXG5VnprI
 XobVU17OEPH0n5/Gz3z7qH9Oon84M29fWaJGGmObdO/Gt90cxcZYjhOSVUNpadW96hd3RxB7qd
 V2/Zii3tcoAAAA=
X-Change-ID: 20261114-configfs-symlink-uaf-c5d84bb6a976
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com, 
 linux-nvme@lists.infradead.org, Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634191; l=1520;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=9HaOXwSMwzKzPRbmaH7JW1q/kvKxDa6hssIZEkktu2c=;
 b=rW8QB5s2N3tYg5kXg2dxxatXuShumKYKJNvd+OxMHLlUDbvc2euh1vEI8+phoHZm58K7gwdjg
 uNpq5iNyl2uCPKSjn74kj+SFs1Dd4UJBYL4ncLs+sYnGvpszhu6ID77
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() drops the parent directory's lock while it resolves
the link target. Two races in that window are fixed here:

1/2 fixes a use-after-free when the parent is a default group whose
    containing object is freed by a concurrent rmdir (syzbot,
    nvmet_port_subsys_allow_link).
2/2 pins the target against rmdir before ->allow_link(), so drivers
    that walk the target's ->ci_parent do not see it unlinked
    (NULL deref in uvcg_streaming_header_allow_link). Found by Sashiko
    review of v1.

Changes in v2:
- Add patch 2/2. Patch 1/2 is unchanged.

Testing (QEMU + KASAN, v7.4-rc2): the syzbot
reproducer crashes without 1/2; a UVC symlink-vs-rmdir reproducer
crashes without 2/2 (with 1/2 applied). With both patches, both
reproducers plus an nvmet target-side race run clean, normal
link/unlink/rmdir still work, and rmdir of a linked target still
returns -EBUSY. syzbot #syz test is currently disabled.

Not tested: lockdep was off; LIO (target_fabric_mappedlun_link) was not
exercised.

---
Izaac Chong (2):
      configfs: fix use-after-free of default group in configfs_symlink()
      configfs: pin symlink target against rmdir before ->allow_link()

 fs/configfs/symlink.c | 66 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 20 deletions(-)
---
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
change-id: 20261114-configfs-symlink-uaf-c5d84bb6a976

Best regards,
--  
Izaac Chong <izaacchong934@gmail.com>

