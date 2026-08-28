Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D32D0C7E
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895300; cv=pass; b=AldvfNAMgzzvrfYYXeYJg1pawQ9uFR19XrwwzbShVble9TvwWyep7vVXGQs2xl2/rOk1mASHoB+zzVzXs77QBIY43ptdYY89WfFNzcTJefg1JedK6JxI3QW8ixUUgg+NqfsifjyY3G36QteppoAmWf409mJVFUezIZ3GWI/+uQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895300; c=relaxed/simple;
	bh=sO5dSXBaHvsFXkX2Tziwa0K3ga1aeB/vw+imQuoh05A=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=c4bCSeCL+AcsUiCmrci+qHIDmv/7sBoNS9CVc0uxnI9EEZLYjXhWMPQbXqVesEjC3Gwr06jr6PuEbPW5gKaddnbZnjcu1ro8+BuJ55vBPlW1nZNPYLkmi0KAJd17hI3hdWoiDkM6sVHI5yr0vjjZP3Qb0UsE5OyeRgb/UNXrino=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=oPztFiqe; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="oPztFiqe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3968e063f84so574958a91.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 22:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895298; cv=none;
        d=google.com; s=arc-20260327;
        b=fDthLt0ZPZgmW22r03hjuPc/h453Nngz+EHs7Om5Zwjac/wrko7MKNh9ucgZCI6xiu
         smI4AmTASCEfoyRbworIxhjY8kKssI/a0irK7h7aBXuZyJB67VYcQneynAzgj1QHFuBS
         mYPD3HsqtoXQmpulUxHrbANVY9cu3t1w15cNZY4gcu2aAEcR0Wz5/zsat/rcrcPOqMh1
         ymoCdveFYJxPutE0dn/yODS2j9EV00DHe0EfQvUIZ5MbUUFtdbkq8jeXQtmLZvieFA2H
         CDLnzqYibOlJusA4UwLaPHHfKtSK4rUrKu03+cVaqh8x3HIAq19ahtfMIzRpCGx0K5ac
         q7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        fh=z48fTMCKMPs/3ftW0otw9UWFJIfAVctXEaT34+GNy2s=;
        b=XmGPQ7Hi1PLmLJZrxS6Ca6tUqXKy7BdJwSKPzWrx8NdIVbhHJmYwIItqSqU6Wc5mlN
         YUrdDL1BpQAfQqFZ2yIt0+8JOlnE8TTUgvQyQ70m8ujOaPNtw7As19cGl7qv6JXNSqW1
         dXqSGIDtajsxAmpYMqJ8gq2hZPZK3PlxWI6XZWhr6KYPepB8W8TIWp7FIbVpoy81OnUA
         f/UoNDy5gEI8w1widrOzgMGFeJzeEjlzOT+Kdr+F7dIpzaMwDevlCKfJ9H67lBA2HiYD
         AhxFDOyae5SEo4TxCssnien4pYDnsHjjkB36pCqZSJajHhyUUSVw00mWNkg0CDpBGvkB
         T0RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895298; x=1788500098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        b=oPztFiqeU2/8NvmWKsButQVdy+hAjB+dV6W2E+EeysZVNDYSc1FjLcLGyaKui3MzUk
         RYP3Cjcv1Jx6E0Ige019QdOz1T3JtvVDk004w4tbB4MWg1S2GCFeBKOeXurIDWIhoojz
         7OzHN5si/8+0+BeMzEzMNNbBzktHkX9Qd2Ww3nq03WkJDLodw7ZeS+f8zxFo2gAh0U3z
         R032LAjXPopmI6YvC4XkOraQj4Hvqhh3zwM5tiAtAW0qi0Z5oTuywClH572L0RA/+SrL
         QyVImnK1IFwb7zO9PNNf7xbJfh9uhgJDKyrunlwvx4WYSXyujC/qij9jBjyhbnDZwktO
         flbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895298; x=1788500098;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MDPyu9NJUwBSIvoRoRLkuEmxgNNfQg32MOjandJIVTk=;
        b=d5HOeUrgw5E5hiCHN51Iec1DcGTD8Q4RfPi5ZjkrBan6qMkY5K+U4TTZRjm9ovBtnX
         b7OheuiXebfWKEbN/6Ej4iAIr34KXc1p06wON0Q+RNXWvKuzc1jdAVWxQ7Ze8Y5JQO5F
         q1buSFjGA0+tDQXhNYXoLcJ4kiYYyvMa5d4Vqbee1/2nnaiOIf/EvXo90X7KUJ+CC20G
         ZpK1KKgpGbcz8uNZanUrs4oJqKFOewfQGZPpZgCxTJQr7KB83CXwSChq+BI8Jztxrkff
         G+yXVMpfRxjsQyVFY50BzmeDgPk8O1ecxfikFs5tC3btD2A8Q24BguvKFlZlhkO3JDal
         cqTA==
X-Forwarded-Encrypted: i=1; AHgh+RpzgDtDgSG2/jSi4Zm03ofImGexD0+nZSkr1JrR9f3275EQNz9iUXPNXMLaqBBf7oRSC5MgS9R/edU=@vger.kernel.org
X-Gm-Message-State: AFuF++n6fPBLpWHGv3LfEEeDMEHNCCbadNaFujaVXRmII8YC9zHq7MR0
	CPU0eFiCMfFCktz12ecxMpT6z5g4+6WMA+tgaWenQe7PszkFFU3adzai6O7TK9Xdsrt2EUB7oWL
	J80Lg/5tiRD3QvBpE3t+WvDj5RUpu5B/UqMi06xBp
X-Gm-Gg: AR+sD11+g+fEC3Rj5MxAu3scxiRVIwfN6IubyiPqK4XQRDnrGvrRz94fe1fzQODV7K8
	9WeOEqDmZsd8TL68nJe/C1XoMsb80pWasN/nwKeVXNWz2wMlh5f0XdtaX0dE43o9TMzqTKaOvTt
	Qsk2Pe4idssm3D6p06Po1irBqSiFquhgSBIP6bTo3slCLx0u7Y02/AB00/uiXilZBQa5ZmcCydT
	d4BX4zufQRlzGDNpMiNiEKri0O+h8FLlGwO6ZFCEuULFwU2y6H+hd/kZhH7FVxipjd6Oji90EDq
	tHBNws/pto41LisuwmTelCH9nXBX5Ktidtt/gqB24SBd0zKxD4gOoZzaymhfo21pUR/QcnNQ73h
	sxC4veEtPh9kO0WM7zrfCMlQv9E4Y199pqg==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id
 98e67ed59e1d1-396d0f69d10mr7205264a91.13.1787895297054; Thu, 27 Aug 2026
 22:34:57 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:34:56 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:34:56 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:34:56 -0700
X-Gm-Features: AcwNN1Wfzp6gNlZZMQnQaX8vcqcoxNhl1n6Biw_pymg2M1kxA9FjqGACk_v-958
Message-ID: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
Subject: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-chipidea-foreign-platform_data-oob/

  BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
  Read of size 4 at addr ffff88810e9061c8 by task repro/9505
  Call Trace:
   ci_hdrc_add_device+0xb76/0xd10
   ci_hdrc_usb2_probe+0x22d/0x370
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   device_driver_attach+0xe0/0x1d0
   bind_store+0x1d0/0x220
   kernfs_fop_write_iter+0x3af/0x540
   vfs_write+0x61d/0xb90
   ksys_write+0x150/0x270

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
