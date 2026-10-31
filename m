Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417044;
	b=QkmsHyelwcVgeG9OdIOUVu0j0tymMPH+5fBCFlTvuFzlCfbO003xUK2kdROYClle8sNx
	 W5Dkq7KaRPCjy2aOzktxCCBvOx1G6XkpQSkj9T05lWfs39qgVGwcPNZA5X8T2/ttT6fU2
	 ZC/KcSuNJeKt6j7cUF5Ilkbout+LTnvy4npSGW14o2hgnOJLCM3QvbevDvKU4NgmVRhZs
	 D25u8I+y6H/IldADuoBCxkhQlcOETw9CtNsKR49YxR3XitgdTYOM7uLB3EmMWwJGxeeum
	 QYlneINTg4VUgQGwAQmZkEwVcHlap1TrRtDgPjubONh7J06CXu80ufvYH7NcKePVROQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
	b=BOTiICeslsvVSARRerczl0m0M82tf6ACROUeQUYY5TCAIxTr4frXUti+3QPDFQ9MNb2a
	 Q/2ZlmVpvO4n/Sim167u2UU7ToJV4qUVm6AvZDo5hZbiZtGlgG8JEIfJd4j4XcP1Brqha
	 KW7XNBmy8/L+aM+fukqFLi0S9xAOSqy2yHyW/CQFfPvJJZ25qz/LLgnC4OnAIZ2meQwrv
	 yJbIEs4eh2SjTVKX7wvIQuMxGnYzCTSVfZ8xuXw/ltGrgpSMbLh5dZJ00/KEgypqD8F9u
	 TkmZJiZ09KAa04BHBJFXd7BaShJLH4XzOCrXct8c85b6ReRGYHRnpUKpSzBqzytVuWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=riff.dk;
	spf=none smtp.mailfrom=riff.dk;
	dkim=pass header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ed1CwJYq;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86A606A31C
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 03:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E86A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ed1CwJYq
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so668305eec.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 20:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20260707.gappssmtp.com; s=20260707; t=1793417043; x=1794021843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
        b=ed1CwJYqAGOESnj3Z+mUnQJNeKgByTtQGWvq88fVuusPVTArDcaDbiOMsknqEEKp7h
         54Ngi1qEr7fZ8Ru1Fjt4cZQaviLc65EaYuA1Eq0YiOMD1IrWWMSDwmctEXn5qNB7ShQd
         Ow3cu9Zl5fmr5RJVWlrqWDLOodaX5vZgNplxxsiAoqDk8xk8ALwomHKToj0LDx2KlmW0
         Y3JY2ck1x/W43dYAamrGCUV2mo94qk7eUJU4eyxm/9qMCSf1fPH+BNXScRBbDa86xH8w
         2zDIC+sg4z6pUw4Ll2ripZvRWEcWLzD6uSsfz2xO/oi1Cy2Ntl+rzR3M8hfZqN8z8MSW
         jEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417043; x=1794021843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
        b=a1JqEgBHUVU8h/IKFy6yci7v+gDlJgsVI386TYlxF1NSSd3tNhMEWkJvc7WOVtDgS/
         KCMyPQr+gEu0sXFwfHQ+jmCKYe7Es8kKLVcyhZnJwdbv3aWeoH8lI3Z4CqvtgJYZ6wLs
         nrqaqe9UIVqamp7Q+diScwwxfqIdnWflPGZ0IPFYDfQmJsud36eeQgSz836uDwFlUyVz
         yhj5UsnZEL4f1Dv+IKV5XKq0h+wXBXHhkP0ug69BuZ7WKcaFN2Hy9BlRaFMyI4Ivn9M/
         KFWDYGQYXLdmVIXluJQVqsRs6h4cVhi03wdGwG8TqpVW4Uai2LubVUXN1b4wfstwV7ae
         8IeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyU8BOOYnBY8lgWIRo4DJvnq7QobXJf3Tz7O/m9Xd3xSaWvkL28XCXYgVeCa7j42fcFXtNw61tJlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwJw/VgayPoHN5T/1eShiPlIDmgOlVVL4lfqpyqssqK8EBJ4s3
	G2FrshK9gtLueuhQcqOFpHQwQzVSP4ObmstuXlVK6ZOhfMyez2Kj+UEFD9OcLD380lo=
X-Gm-Gg: AYBFou1Zdiugxgic4p5z3JTje46WFfzrunat1XoxgEcoUFzS5+GfTPJJy34uNFSFaP7
	2/gnJaQJgXanr6POGbgiACVYGfsJg+wkMsnWBVjW2b9DaZAS8PtGKbAOENV+Kr/DtarkSmqL2vt
	6bVJ3DC0LOe+bUWgn9uGldvPc0+JuZc3d5A/D8p87ltdDjAtP14X4e3vJ/xX/8emGFDcGvO7Ajw
	mfhEmsB6dPS1mamGgHvcTc2Gm9yUlqNUomED/mV2m/PXKA1IA0AscTmAGCACi/tv6vb8Jf6/5Zy
	wpxWYvSZdVQT/bdpBSPw9XmsnyldK/SA+srm7SNfSuorGqw9/tnaIQPnDlqbLrOjVF9t6qnnRKb
	Rqqr3lks0+osVtdJQnF1gTTGXNPYb5fqPvMNoz5yc5C+SlfIPakJfNCwDYnuneBkphedyQBGSBA
	OMdJcGZps/agpkDPiK2JYoOfvj6kHETyGHPoZH3EzVtNFpffSO3H1UCMbeRIH7wJyo8eTn1p6Pi
	VOr9IrBrxQh/V7QqWihYSxOd7FM0VEOf/pf7s/CN6b8GnllEd3jZjbiV1ih4Bc5s04TlWGUPmhy
	YfJUla/qtFu+Pxgb5GntddpQXbQMmX/9ttO5W1I=
X-Received: by 2002:a05:693c:88cf:10b0:368:2548:c08b with SMTP id 5a478bee46e88-36a4239bcd6mr6791862eec.21.1793417042543;
        Fri, 30 Oct 2026 20:24:02 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:333f:40b4:73c5:a898])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm10920505eec.12.2026.10.30.20.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:02 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: retry init only while the PPM is not ready
Date: Fri, 30 Oct 2026 20:24:00 -0700
Message-ID: <20261031032400.38349-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
References: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 254261381538 ("usb: typec: ucsi: retry init when the PPM
answers early commands incorrectly") makes ucsi_init_work() retry
ucsi_init() on -ENODEV and -EINVAL, a hundred times over ten seconds,
to cover a PPM that is not ready to answer commands correctly for a
short window during boot.

It catches more than that. ucsi_register_port() also fails with
-ENODEV when no USB role switch is available, and logs that at error
level, so every retry runs it again and logs it again. Where a machine
without a usable role switch used to log

  ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch
  ucsi_acpi USBC000:00: error -ENODEV: PPM init failed

it now logs a hundred and one copies of the first line, followed by
"PPM init failed, stop trying", on every boot, and the retries can
never succeed there.

Have ucsi_init() report the two not-ready cases as -EAGAIN instead:
GET_CAPABILITY reporting zero connectors, and the PPM rejecting a
standard command (-EINVAL from ucsi_read_error(), the only -EINVAL
expected once the PPM reset has succeeded). Retry only -EAGAIN and, as
before that commit, -EPROBE_DEFER. Every other error is reported once
and init stops, as it did before.

Also give -EAGAIN its own budget. The hundred retries over ten seconds
belong to the USB role switch wait. On the machine the retry was
written for, every observed failure recovered on the first or second
retry, so ten retries over one second is plenty. A PPM that
permanently rejects a command now logs "possible UCSI driver bug" up
to eleven times in that second, on hardware where init already failed
before.

Fixes: 254261381538 ("usb: typec: ucsi: retry init when the PPM answers early commands incorrectly")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com
Signed-off-by: Jacob Riff <jacob@riff.dk>
---
Tested on the machine from the Fixes commit (Lenovo ThinkPad X1 Carbon
Gen 14, this patch applied to the 7.2.6 driver): 6 boots, 3 hit the
race, all 3 recovered through the -EAGAIN path (two on the first retry,
one on the second), none ended with UCSI unusable. The single-report
path for a permanent -ENODEV from ucsi_register_port() is verified by
inspection only; no machine here has that configuration.

 drivers/usb/typec/ucsi/ucsi.c | 37 +++++++++++++++++++++++++----------
 drivers/usb/typec/ucsi/ucsi.h |  1 +
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2f9adf4..9e453d2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2106,7 +2106,7 @@ static int ucsi_init(struct ucsi *ucsi)
 		goto err_reset;
 
 	if (!ucsi->cap.num_connectors) {
-		ret = -ENODEV;
+		ret = -EAGAIN;
 		goto err_reset;
 	}
 	/* Check if reserved bit set. This is out of spec but happens in buggy FW */
@@ -2172,6 +2172,16 @@ static int ucsi_init(struct ucsi *ucsi)
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
 	ucsi_reset_ppm(ucsi);
+
+	/*
+	 * The only -EINVAL expected on this path is ucsi_read_error()'s:
+	 * the PPM rejected a standard command. Some PPMs do that, or
+	 * report zero connectors above, for a short while after boot
+	 * before they are ready. Report both as -EAGAIN so that
+	 * ucsi_init_work() can retry them, and only them.
+	 */
+	if (ret == -EINVAL)
+		ret = -EAGAIN;
 err:
 	return ret;
 }
@@ -2249,16 +2259,23 @@ static void ucsi_init_work(struct work_struct *work)
 	}
 
 	/*
-	 * On some platforms the PPM is not ready to answer commands
-	 * correctly for a short window during boot: standard commands are
-	 * rejected or GET_CAPABILITY reports zero connectors, seen as
-	 * -EINVAL or -ENODEV from ucsi_init(), and a retry moments later
-	 * succeeds (observed on Lenovo ThinkPad X1 Carbon Gen 14, where
-	 * this affects roughly half of all boots). Retry those like the
-	 * USB role switch wait instead of giving up on the first attempt.
+	 * -EPROBE_DEFER: the USB role switch is not registered yet. Wait
+	 * up to ten seconds for it.
+	 *
+	 * -EAGAIN: the PPM is not ready to answer commands correctly yet.
+	 * On some platforms that lasts for a short window during boot
+	 * (observed on Lenovo ThinkPad X1 Carbon Gen 14, where it affects
+	 * roughly half of all boots and a retry moments later succeeds).
+	 * One second is plenty for that.
+	 *
+	 * Anything else is not going to change with a retry, so report it
+	 * once and stop.
 	 */
-	if (ret == -EPROBE_DEFER || ret == -ENODEV || ret == -EINVAL) {
-		if (ucsi->work_count++ < UCSI_ROLE_SWITCH_WAIT_COUNT) {
+	if (ret == -EPROBE_DEFER || ret == -EAGAIN) {
+		int limit = ret == -EPROBE_DEFER ? UCSI_ROLE_SWITCH_WAIT_COUNT :
+						 UCSI_PPM_READY_WAIT_COUNT;
+
+		if (ucsi->work_count++ < limit) {
 			dev_dbg(ucsi->dev, "PPM init failed (%pe), retrying\n",
 				ERR_PTR(ret));
 			queue_delayed_work(system_dfl_long_wq, &ucsi->work,
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 1996f04..140d34e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -491,6 +491,7 @@ struct ucsi {
 #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
 #define UCSI_ROLE_SWITCH_INTERVAL	(HZ / UCSI_ROLE_SWITCH_RETRY_PER_HZ)
 #define UCSI_ROLE_SWITCH_WAIT_COUNT	(10 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
+#define UCSI_PPM_READY_WAIT_COUNT	(1 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
 
 	/* PPM Communication lock */
 	struct mutex ppm_lock;

base-commit: e971f4f365bad51d01bc90db55b56fdb3124f963
-- 
2.55.0

