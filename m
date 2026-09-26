Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430544399F8
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.231
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790423128; cv=pass; b=Bw3Ok5BV4XiEoblaQnJZSg11jKH01+9EJiyD4G8b+R61WbQskdScOB33cRtrtdIIZvil4p8ezBJh/WvSNs3QkqWc4KicyOxggMxGvrrsQ1TdLkZVXBYCi9SXji+c/RsTQJq9BhopCqu4y6wH7d2sqAFKSp0CI5Q1UyGlGQaQsSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790423128; c=relaxed/simple;
	bh=+/6PnzP/DyUyRgtWGT3dsCGNGxxlywPQo6BIiWvNnlk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YgBF98QEQ8e05o+RfQTmaCWc4zdBtVl0iYfJjrRT/ajCoXuqtAQyLJ4wF6gO1LK9zsKK//IPlKD3TgIxHh256fIjrdZ1zSMAYAc9vGC6IUhmSzbNkxS4xzUW1qZ6WanYGrQQM9/BCEe2FvdMNHuEuq+CUsBgoJCO/+XGKAUXe5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aonRBtHZ; arc=pass smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aonRBtHZ"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5333294b8a1so98211cf.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 04:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790423126; cv=none;
        d=google.com; s=arc-20260327;
        b=SLHfFCyYBqxRRELAaW2Dam2dBnaSOmwuIstIO2Yk6dwCKg9cQZuR9R1hIe0uRMfdQl
         VJtP98yhOpXVWPS49N/a7AjklWAAumfYwoPcPo6z1oTi8Q4zPArvHz/ym/0df6jty77U
         Scc2HC1X1Ejyi/G79L9dRW/aCp8oy+IM63kIF3I8wcsjZ97rmsy4uh3lRKrbcKYOyddI
         bhfFnZfRsFiQaFkIEzWakwFmnV9nMHgYVGYR6IG/gpd8dKlOBNUdVUiyzj/6vfdeHOMb
         MhVroDAN2M4x2NjtRjjNOJ6J00afzIoahWXPvWYGkNuew38zQyUNudNDlHJex/J43h+o
         Gxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+/6PnzP/DyUyRgtWGT3dsCGNGxxlywPQo6BIiWvNnlk=;
        fh=HXYDs94KzwTSsUf1O3tCI1GSm/xkj2EYYWY1hO6y3Vo=;
        b=NE5uiiEYDj5dPK54kXgr/sNd7LUG0nISMghbx6ymqoDca84PDND+rvU6S+0BmzG0dX
         Xq7ayRzhl9cs+tQfbZLgFDh4xobZz28y2xOZlRhcntHinS1a5iwjwcdVDkky3RkZubpM
         XMbcyX0fFIxKOjTPL58k+BZk/lYDBAPMbWIi6Rwvgn703bktaaEwebXIPDPjzYF0K37D
         EC+mvwt33zVDRZrwXSThvJU4r0gNyZ8TjdTX6IBaZcNr4H/vXokbbMz1WL9Eh/nmv3VV
         W1WDE1pJ46naZwl89onzXwLajMSX+FOcmRIjsyBb8mS2tihgdZYhYvullT4BOg1B5MIu
         t4Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790423126; x=1791027926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/6PnzP/DyUyRgtWGT3dsCGNGxxlywPQo6BIiWvNnlk=;
        b=aonRBtHZSDGnhYUQ8/glpB302nigjtskNOQHw8SKi0d8BFBD1IoSIxp736utvSY3bb
         xRVPweUi0p5ssNaIAITNPdX9nQmSdtRXOlwBhSbbPIgmb7Ecn1UKk/tibwi4/FkprUth
         ALenk3xTDe7iUzluZcff6B1HeZQsEWupIBUfVkJXqY46nbRrwVRKvRwuDgwAJwCSsPGX
         LwAaeNPAXmC/4TlCyivCRuU/lmKgNTqRm6k+G3t0rHP/FFKUFHp2JFADZef46RozaSWL
         5OtkurcDdirvHX/gG1wo0fOBDTYV6xq5fSY620XDqDG3fhsZbNW6XjWJHtkTpBL0TaI5
         TMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790423126; x=1791027926;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+/6PnzP/DyUyRgtWGT3dsCGNGxxlywPQo6BIiWvNnlk=;
        b=wCxwIZPJX7RI2pftQF2FYrxgm33h+iFEpHEvKDvrvwIvhZdi7hbNPouIB9Dau2+oIy
         FLNHPlKnOCcnV8vIVmcVs3HKX4SUvXqzqZFmX8nBvYNtG3l2k6FOVPwkx7xWDZP//mjh
         FNYclUfGweyliBQel3IGJsJwZ4fggDRVz43v4wfcpmn3dGaLpjfLzOoUkZdH+9UlCrYe
         wwTXyVg8SEM/1qk/qwmLVOc2+Y3b2GGim9Ab1+ZnPSfhBh0EBJwNIxJ69PlrG7zHQGkb
         F9+Xb7xXzOxHRX6YqA38EpD3JT0VKpKp1SfW/VWCYe9Y+C0qtu2QvK5b4LJ+Tpe+wsPX
         7m8w==
X-Gm-Message-State: AFuF++m0VESPLnYxjBgdDWfFvTYITeWQlare/0yQaidRQ22djroPC0fE
	tpJPFyupfZoNYW/eHAgJTrscEc3zwovdq8FxGPxFHMBUWzM874MiGgt080oAmoiOBBGi48U0JuC
	ZiIedkRq3i2kXy9KoAU541Lqo22teVH+pFKAVu2sQCw==
X-Gm-Gg: AYBFou1/SsTiqJQg79GszjqKgDh9f7oM4lcltyQEb0u6ywkVk1nMn/BFCzSAvWqQThc
	UvxLLLtZOT6DyaxQYK2JwV2ruT5AnNBu+PdrwfXUnH/Emitbi801sZBGIDh+F6vz00SulvgZRYh
	M38X3nOk+Sb7+X2tGxFO7+1B1rLF0eJiNkoIuIt09ual4a9LUPC/G1fXxIrxrbjx4cYLvjFwnwe
	9HaiOSF2tRvjwwqOwq6g7k4ReV7C8LMrf560m4tQ6JPtpl+tjHykbOp9XkqVHDUdlOLye++oX4J
	oaYZHk7N0kZcyS67sfgocnKdd5Sbh0t/Abk4otwu15zkyUrOxGh6SjHo2rrwWg1Ab8ccaon65yp
	/nXGneLI1qVLVjQMAhf8DiVs3bBSXREgtr/ZxI5dnYI0jnnVpV2VgVQ9R4EAt7IfDAmV+t4BuRL
	FUm4c=
X-Received: by 2002:a05:622a:1cc6:b0:532:d224:6f5b with SMTP id
 d75a77b69052e-5330b58b34emr100101191cf.5.1790423126136; Sat, 26 Sep 2026
 04:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Leo Korotkevich <essacult@gmail.com>
Date: Sat, 26 Sep 2026 14:45:15 +0300
X-Gm-Features: AclHuK-bZXij6SD_CE41PUCbH5Fr6H9pKlzquN9btCfpVcuB3W3p1TLAwOQpzh0
Message-ID: <CAEOLtbAXRO7zwWMtmVTG4X9az-ifFXtR1XgP0O7dNaCvZGmc5g@mail.gmail.com>
Subject: ASUS GU605CX: diagnostic guidance for hard freezes and USB-C
 power-state changes
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

Could you recommend low-overhead USB-C/UCSI diagnostics for intermittent
hard freezes on an ASUS GU605CX, Core Ultra 9 285H, BIOS 311?

The latest event was on CachyOS 7.2.7-1-cachyos with out-of-tree NVIDIA
open 615.71.09. The screen froze and local input/VT switching stopped
responding. The journal ends without a nearby USB error, OOM or panic. I
have no evidence that UCSI caused it.

Freezes recur across Ubuntu/Fedora/CachyOS releases, BIOS/kernel
versions and performance profiles, Xorg/Wayland and
dGPU-only/Dynamic-Hybrid modes. I also tried modprobe.blacklist=i915
through GRUB; freezes continued. They also happen overnight on a
stationary desk without cable movement. Some coincided with movement of
the charging plug, while deliberate unplug/replug usually succeeds. They
have occurred with the OEM ASUS charger and Lenovo/Dell adapters with
different voltage/power ratings; exact specifications were not recorded.
The current Apple charger reports a 20 V / 4.7 A PD contract.

Historical Fedora logs contain 1747 software-reported AC/DC alternations
on March 9, not verified physical disconnects or a trace of the latest
freeze. During successful recent reconnections, asusd changed profiles
and restarted nvidia-powerd. UCSI_GET_PDOS failed (-95) appeared twice,
but connection recovery succeeded. Brief profile/EPP changes also
completed.

ASUS PD_FW 0003 declares firmware version 39 for the resource currently
reporting ESRT version 1. It remains unapplied; its release note claims
no freeze fix.

A bounded collector records power-supply uevents and contract fields. A
temporary UCSI trace saw no events and has not been validated against a
physical reconnection.

Which tracepoints best distinguish PD/PPM failure from normal contract
changes and the platform's AC/profile reaction, without active
controller polling? Sanitized excerpts are available.

Thank you.
