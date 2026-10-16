Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B683161A1
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155051; cv=none; b=keqfWteBXDVnmOA1Y4HfWqwxyu3SMiNZuUdRXSqTmspjjujifX6htvWd+/YAEpfs8NQFDJb9IUM9ID3keg1eEeGvVR55lE2jolAzfqe+tbFr8MkDJ37TOP80QdN5X6CDGAEfAyeWcrBosy65wV4CSR7dk9ReLHEubK06aXvSZm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155051; c=relaxed/simple;
	bh=s4rcpm684AbbWFl9WuUkuu3EtJDM/Esqd6+a5JxGRSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To1UNi3spH383Tsrkpddye5YY4KXf98PHlYThpFqcOTVb2UFJ+BwrH0gh/c5fUIiuNuz2WG/kVWqZmr1t8wSe3CDn7iSUWuy6fbG9VDDPApfUC0CO4SI0JQgEQ/EiQ5iD7M8MxBSa4zdMxCaWyU2sDBzsDKko3ZdpLd9PUzy01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbeUr00P; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbeUr00P"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso453038a91.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155049; x=1792759849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=SbeUr00PMKD3O7+Oyo5zHisGWnIRtUdMHDQ7eHQOK6EMsM4SJl+svyy3B3TU1RvgCS
         0kdqb+RHIqNgr+L7lZdVp1rmvHw7MCKn+QrTNHeTyn/kLhJZBeeJmOpCRUYTh4rufhaf
         eLSsZ32ihbKind6a60iQVbjco2HgaIrHR/0CMOR0kBsqSaEnrfQU7PwHJTuEg9yxpodl
         zzTNdy8Z9C8sxs1OZMoUDZ8WxfIf4YhHAkIOKCzgs2eQRSJY+xjrst8MaAbl/i+ZKHWg
         9ru5DZYRsF+RgiQzEr++eDABcleJXpJce7NAXS0jGMhpYRl3T4RKLdRfNGYs3EbELISM
         ItcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155049; x=1792759849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogy/UTo3Vu0INpL0C1Y6pZtlcOAen6uVXSl1ntl6vTo=;
        b=UiZO9KkBYSW6iLuOqVnzaCDzX9S/xgSxgVaKw/8BUGF+IKFjIACELeCB9CYenAepnq
         Bz2hXCW/KBFb0U87FdjrClgf6P4FhBZ0wYYLwvYZiBHKBJ0vZjelyEkmQSWTgHk2RNKu
         QLFAQp73rcgSCqkR8fr0HtG/Mh7o/oxy/iCU848mdODGybJSg8Ofb7oGN7w9aN/A1wsm
         Mv6Lbpo6JjCSFKS7tJ4L46D5GLR+18s0CwIvsndlocwbekKnxpZfyTpJu8dOCDz5wRzf
         7+6Gay4L3L0v0u28BK0bX0/+o/Gy1xCzz9eucUBdHUtc6tgDyO+oj/oHUZI54EIm9EDd
         717Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEc991Sf5QNZ430QqPD1Sr5GuhmMhB9fLtF8b9ah2yLm1WzoLQ0agPbn1+8s6+GViFtmz/0ZAPRfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ6geKEkmqu84ZJ80SRlMYQ7OcYiQAr0N8t3XbFqF6Ewdr7QRd
	sY2kZvaYZryH5fy2POHDL2dyZXCdZWVIsKWNccyGZhO0WOU2oGqKA7fo
X-Gm-Gg: AYBFou0K1oIP4al6x1mK0bUxxV78o1753s+3S5/TXqqGiTH7IZU+UGcTEE/B0CsO4D6
	hclq+uw8gQkAP8P1QKjh7CWgkHE/d4Gtpbt9CrkeSU94muU6attDx49AXVgwleTAcC/pUuEAj6W
	+TpzKdjUz3zomua5U/RQHnEoy8ziTWgbp9Sw/pnXreJE2+LOKq1d/S79vasdpghentRBc5P7YNI
	6xkjqjzirRXEyIaFC57R9KSDCHQMAZ9vWTnBPkYwoErGbPMOqfJeDHP6uTwWqN/dmsqrl7kiG+w
	Ot0uwUVTcGLk7pajfS8Lwg0He3GzsP4mHcuQ0eytXl7TsHfvI0djDIwpTr+avs7qXki0EK5cxbr
	W8OEMY+hXe0MwNq/zeQx03YGESurHIZ3kIJd0ghpU81wQji82bCUNU3igEnsnSMdm/VDe+iRVur
	+HgiHXJMF7MhuPdqdPN5zzeK+XBQhc3A0tfVDJW6hdjAs+2gbxfLE2WpyBed1HEVb65kfqdhUTr
	SkBbnivI8POFME=
X-Received: by 2002:a17:90a:4c82:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3aba3ee3e2fmr11173340a91.22.1792155049139;
        Fri, 16 Oct 2026 05:50:49 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm9106546a91.8.2026.10.16.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:50:48 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Fri, 16 Oct 2026 21:50:44 +0900
Message-ID: <20261016125044.1085-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending with the lists on Cc; my earlier reply only went to Abel.)

On Wed, Feb 05, 2025 at 01:45:05PM +0200, Abel Vesa wrote:
> Scheduling the USCI connector worker on the freezable system workqueue
> instead will ensure the devices are resumed by the time the worker is
> scheduled to run.

Hi Abel,

You mentioned respinning this together with the altmode change (now
7d0767c5cd87). Are you still planning to? I hit the same problem on a
Kaanapali tablet (Lenovo Legion Tab Y700 Gen 5) with an FSA4480
orientation switch. Unplugging a USB-C to HDMI adapter during s2idle,
with the altmode change applied:

  i2c i2c-2: Transfer while suspended
  Workqueue: events ucsi_handle_connector_change
   fsa4480_set
   typec_switch_set
   typec_set_orientation
   pmic_glink_ucsi_connector_status
   ucsi_handle_connector_change

and the system never resumes. With this patch on v7.3-rc4 it resumes
normally (2 of 2) and the change is handled after thaw.

On Dmitry's question: freezing the ucsi_glink notify_work instead would
also hold back command completions (ucsi_notify_common() ->
complete()), so a command in flight at freeze time would wait for
UCSI_TIMEOUT_MS. That is from reading the code, not tested.

If you respin it, I can reply with a Tested-by. If you'd rather I send
it, I have it rebased on next-20260928; just tell me how to credit you.

Thanks,
Joonhoe Kim
