Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EF83CB2FD
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503858; cv=pass; b=iW5yTkMoScg48dk/P1B7j9lVFNClUoKjQqc5H7+84smyRc9+pH7NQ7uSU1YV+i0EWVnEJtTwg9AJk8wipl1Z0Ya6XT1b9AMv7uA5rMa3puZmh7/+0AuGXi6VC/Jaabiu/wN/EwZ7k/fBqX+G1GqcG3kaDXXdejfoldw3SxZl2OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503858; c=relaxed/simple;
	bh=3n/tPueCPJNh8Cjq4ztDuce9BKsfPerDfH+SbmGQw/Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U4Upmsm/C4Ik9A8Z+XHcZbh0OX3qw8ee3BikVBZ2UrWlfWNEEmKloS13Q/wbJ6+9ojAYkFkdNhr8Fs56tMJUHe8dz9GgQK3WpDpde4BPIis3ynq+/7aej5oc/ncjyWxm2dUraUBSVKWdHdYylGtivIxd2+nI4kBOWgGOWgAh2VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDEXEjY2; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDEXEjY2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso7324746a12.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 16:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791503855; cv=none;
        d=google.com; s=arc-20260327;
        b=A5U++fcQ6VG1w8UdSuOZUa6p1FmLigvAa77BuBK6NrZghTp+vxN+IzdtzKjpC0DVBO
         RKJZLJgIqhSTtsf400J4g3LXgFcxMgo+nknHOiN0Rflj/d6uEplmLwvQjElwRXHpWiie
         DK3QQ8e9CKHL9KoBQT6+D61B3302cQlxGC7z/eEKf/XHTn9QnSLI/WKc+YXKdHTHIBuz
         uTNYWCOr8H0yBuESnkrIETus/J4qLwrFJLqWcxaHIQ20Osy7BS3yVVw+IY8VXNuXumTM
         /L69SoR287ebiai3vHmfedT0/7WxwF91c+K9hSY/qdtGFTu/fdxCS6tN03RfmQ5Rt603
         y8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3n/tPueCPJNh8Cjq4ztDuce9BKsfPerDfH+SbmGQw/Q=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=ipUFnZYeY9FEp66l/4S5LrD0wh1b8H13FHB4VyzglqI+VSVqW/0QSB34JTk8OqgL1m
         mu4qEw0zCHrNyeerX683YE5VmDjGQMy2XEV0cbmK+4j0JzuOowM1s1yO9i74Z5kPND+o
         wPtBTDM+4MXtWaRWCRXRm8CrwXmoYQBK/b2bQhpJb+kION8BO3rOsvN7qoWSXwpVlHgM
         WD3UCQ0ShVyz0WISPxXn3b7qgsgcWgArhQElV3HvNbRXAeBxWUsFBxa+pYSwGowKjOmT
         HOOWvptwTD6P6mD+9DD+pMVYbF8BaP0ZlZfsLZzj5xf9MelGENPagSsIBTGXG0I3aYJr
         skYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791503855; x=1792108655; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3n/tPueCPJNh8Cjq4ztDuce9BKsfPerDfH+SbmGQw/Q=;
        b=SDEXEjY2aXuq8BSkm5zi/wJ4PtHjuk4CPwk24R6CY62NLjdGLsgBv4kcXmyekcj2mC
         a5aLctLKnJdI4E+FkNVH68OBGzhV39nlQKGDfuUlMya02RPZzAxePh/3kXF/4oz3XuSr
         44ZzkicyLPmeVx7Ql51niPeh/S6eAD4IQEJwUhfgCQT1HnepyYcYoZ44+k4tzdJ5qGFv
         Qzd41M+OKP7iqQGh+PQlluHSzP3OyMu/eBuDdJyqJGPUcg3VjczwjRlh/TFCkQb6M0jX
         EHXrqSHg7Lr8qAfvcMDq5zsyjS9CYb5Wkrc01BI5JJ9ihWThS2YJBuEz0Ew1+yvPaOoX
         H2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791503855; x=1792108655;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n/tPueCPJNh8Cjq4ztDuce9BKsfPerDfH+SbmGQw/Q=;
        b=YDtkAIZ9+L1eIyGD5GAUsLZuPzib9wFORENllTrDkp8REA0SlbZU+K31bZgAHXPrFy
         uEROCgcaOBN+5WgWWn3rotnIJGjrh8JmMY8ppD8WbJLx+Zk1Ls0akye05cRCPEUjQ7co
         RPrA21jINoUofS8HYgEuunIiUGlKSF0BD2jnMkAl5XkL6VCIYGoeEtuLnLiyMpR82F9/
         0F5wyhl3t9FeSG5HQk0iR/t0IfNug+8DxRkvYaZxmIWWZZT+SVv5dLVRdqjoO08cNFD9
         Wz7yiL2ayjspFoO2K2kUSVgAeVfVxuYusMRxB++qycZOd78s+4+uovmAF3lbbcqcOF9Q
         QRjA==
X-Gm-Message-State: AFq9FYJn2qX0cbdeqLaCoI/VMm1ULbUahTtncDCPLm/00XiDRtGq59Me
	O7p1aSUyGxakDTfY4nf0iE1ITuCaoIHKP10yaFx2dfHNzJHtu6jjGT1rkR12oTlICk7yU+9SdwQ
	w7l2/9b7+xACFZuUOc4ui3kRZvHX8aijxm58=
X-Gm-Gg: AYBFou2X8ScdcsrTSXO9XN91FcxB+zfOGmzbQVVXVmN7uwmcJ/9A0kv6hdY8iDRk7Ex
	ZwuHCFkm8K+aNGC02vioGLoypcdLe2E+6zpe5FL6epahKy6S7Aj4XQI0BCuGS6zZlOxIpl3q8hl
	qDAMUjQL6NGBvpPTQaCRxgtV+QxjH1S1ZBg0c6+Ue+myQPivtv8nJt6kEKxihPkwiRpbEz1E466
	CR+I2tX7Xgd5kecuzmYlDLNvcfTZJHwFYhImm+lQGVxJ7zxSg83r+Wp/feYJDnVvrJMPxU+7oWN
	+cueQ/dPIkN29ifvEfscZjhQp9GHCXbmKSz4qshch8korAsb7q8xay9BqDJP0DsNOA==
X-Received: by 2002:a05:6402:5107:b0:6aa:f14f:5571 with SMTP id
 4fb4d7f45d1cf-6b17c4f029amr14296a12.45.1791503855044; Thu, 08 Oct 2026
 16:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Karoly Negyesi <chx1975@gmail.com>
Date: Thu, 8 Oct 2026 16:57:23 -0700
X-Gm-Features: AclHuK9wambkTwH5RVlA2_kjzEtADIj_7SXBHFTCWdJLBE_Qh5YErnsIddNZYGY
Message-ID: <CAOfzkkyv44DkobQ7D8Pf=4-dKW16aCJwViVWfHTA9v2phxRHZQ@mail.gmail.com>
Subject: Thunderbolt networking doesn't come back after re-dock
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a ThinkPad P14s G5 on CachyOS, a Plugable USB4-HUB3A and a
Macbook M4 connected to a downstream port for Thunderbolt networking.
This works until I undock and dock again. Then I need to unplug the
Mac and plug it again. Then it works again. (I also have some plain
USB hubs chained but hopefully this doesn't change anything.)

Here's what journalctl says: https://termbin.com/xhiwp Linux is 7.2.6.
The docking starts at 11:15:11 and finishes at 11:15:14, I unplug the
Mac at 11:16:58 and replug at 11:17:04. I would say the interesting
part if any is the undocking at the beginning because during docking I
see all of the following coming back without errors:

1. the PCIe hierarchy,
2. the USB4 hub,
3. the retimer,
4. the USB Mac,

Only the MacBook Thunderbolt router is missing. Only error-looking
messages I can find is "pcieport 0000:00:07.2: ASPM: current common
clock configuration is inconsistent, reconfiguring" and "pci
0000:51:04.0: bridge configuration invalid ([bus 00-00]),
reconfiguring" but as far as my knowledge about USB4 goes, Thunderbolt
networking is not PCI related.

enp0s20f0u1u3 and enp0s20f0u1u3i2 are Apple Ethernet adapters using
cdc_ncm. The real, missing interface is thunderbolt0.

This is a reproducible failure. I would be happy to cooperate in any
way to help fixing this except perhaps coding it, been a few decades
since I wrote any C :)

Thanks

Karoly Negyesi
