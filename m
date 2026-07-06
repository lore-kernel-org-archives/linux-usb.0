Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B1534B1A3
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336420; cv=pass; b=c0xd7lViwo4jmIU0mXajJmzSqmIgYfC1h1t0qsmyghJQKJxhzZhkiPmGFUq92ExDmemRB9vRGRxBl1uAO0MQ6aC8uUWpkCSOvypW5laUK40OXNEh9SeCl3vabky1sOt87XhVxgc8eAUoc5wYDn3bU+HqNzOgsDDpFpMOXGDuV9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336420; c=relaxed/simple;
	bh=AMCaSbh/ZiqHcWXlH0T/N0BidhH/YkSSvYBbWqurz70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ult7Zio8WrQY0lnstnnb3OXSy7vP/q4kNy7wB1B36B3Uj1ZjIhJ5oYH5d+QnXeK+0Ma5i4gqy14PX7/qcXD5Mru6VsiJGHhyGa1jOGb+xKhMItnV/iTQ5Imk4ygbaEXmYqo/w3fU+PyYRShT4jfOr0MXJNuN6dyqUSxFMTqKKeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7KKlWg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZss/6WX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7KKlWg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZss/6WX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFLo401636
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 11:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l037eqxWT6mwjPQfRW2ZRLSIaMTwxnyZwM1ZzxP5Rcg=; b=J7KKlWg1FpZqTMOA
	6VVbJPSD0S+eftlD40Wlu2MgLMrRtuKhF1aGAuSv0vXwdARcLGfzmMWm2OPeH6GV
	fd6gNGkpqZgnR99QVKnVxN+MjOoQXer9Ixa6xQo9odmWGWIIcyhhSnLqn4nlGWIm
	bsNqKt2SX5FTwyEMurjmNj0/bjnUS8XN7VxxG3rC03/FjUdX0fVJipXW2xY7+a4O
	LFpOP+nFkN4wlRJhM+nIN1ym66tmR3ekkLHfnaPVgacOK/2c+m8AZ9XiKHgRpu3r
	jxYKfrQaVRMkxQ/jOGkDtG66bgnYAImejHGZ3tjEZjjrdjQrAHqUMK6JYomxlsNX
	OVBh2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr9uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 11:13:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so44378956d6.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 04:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783336416; cv=none;
        d=google.com; s=arc-20260327;
        b=C9IdsRZ8RNIvHXSf9zXTpqVml9kYSyUi5Gis638uPz3fAZgPs2KElhqJZ4f8kgZCLB
         aCvgyEMKg/dD8QkpDgXZJkT8/lhS3cVORuDntkde2SOEgAYukF82XfzXsaVqeWnrUbfg
         I8X5kQBE0RNH4YBd43deGvUJgBrPjSt3oT1DRw/Dj3zDjzzW+BCwhHfA4VR4jK8vvsf8
         0K3t24tvyQfhCfj74E2RzgklpWK+iImE2w9MW0p3RkldN1Py/ylxDfFu+7wKWvyLVHZb
         kiehqGpcYug8jtZYIkiSj/mWlIKmi7wEZ25Orwx3wJvKzun2pc0NLKuio9l83mNmfBbL
         /lFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l037eqxWT6mwjPQfRW2ZRLSIaMTwxnyZwM1ZzxP5Rcg=;
        fh=KTGOPNiSkvkvnbYPlB9BDQRPlJSsl3fDRWStj7S092U=;
        b=mX87/KUSvP04SuArVv6TQwk4EH/CWR2kx7oeh4k95dszr5qGSQDe4buudQIkHkPIwM
         pJKnd+IGlxOrkyOw72YpdY05g464xEjhnlKQw6oIof9T9zai0g2qFnXAR2a4vw/BnrT2
         Z/qYJ5HDFVcKcxJ77uAW/A+pfYl7j7qt4ZvlyWxtbPMwQ0rE1snaFFK+F3ca9AqeZrET
         H5kP4mBOPNcrD7FnurQt/mXjurApD5xuMh9diydCLZruTXILeoqbSDhLuAQsfWV86E/Q
         e5UnsV/YBQgsQV2Qu5NVkK8lMrb7fH6Lca9noNIP/Kh/nQmPb7BYEEA43pdiJgBaSCuE
         PP/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336416; x=1783941216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l037eqxWT6mwjPQfRW2ZRLSIaMTwxnyZwM1ZzxP5Rcg=;
        b=iZss/6WXffmPUuqJLQcthojQyINo/MkboYO2xxgucuV8CKqDg//QcCAp0dcMZEcpsV
         NSmGsAosy/2Kcvz9qf+sFdamG6uTpcdZ32AxsjP2xMaQRN2Jsn/dhn6XbBgem20w0BSa
         0tVOSzPNm1qoBl9rG4Wpa9ZbGooGhjGVtowWe5058J5vS7HV4Y5WjIsBZ2tmBGOL3kOq
         sEuyipmNPzdD8a1RUt2IYEZHXMmrWjDesDA+T2SgpQtexAdejjo58bCwbmj4ACFPDOtV
         LcYpk6LR97+hAiyvTVjeqT03pgUZWPjzVzN9Yj1/vvO9jLCsAEhLfgrQc39dyR/uRbXW
         O64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336416; x=1783941216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l037eqxWT6mwjPQfRW2ZRLSIaMTwxnyZwM1ZzxP5Rcg=;
        b=TfC1qQiZCX8EVwqlY1GRkuFXAEruhUmShxIgIv+H392M5VZWJeOx/k2WGO1/uYlLf4
         HmlQmpyzE0j1Qxd55GE5M+dfv8wkD/1Qq7QdEQzZJhFk/jF+8gC6ZslTR28lCHhmuoK6
         L3sTYvkMEe7Dchx+bbPFYEEwoNbI3ynt6qgC6uUbRTcqQnaK+Wdn7b4Ze6oo/GSWo5kj
         xlk80B0gsr/KSbOW79I+r8y1OBOsXEuanU9l2SvT5TnCw0Cgjp3JPtTiNcJQ3/8dbhFH
         +AciqwNaG1zspVU1r0nl8kAxc8oWybRd/06ot7NxAIo3uyg1mSr4fei3wLcpT1LGQhGx
         tmlw==
X-Forwarded-Encrypted: i=1; AHgh+RqKGIj0uJYnCQ19ZoO6pXUvNqw5DIfC9VCY4iVfembt3ZV7tsWx0HumSs5mEEzluilYLW+3QpRrS+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFCd96SYxu+EZZSfNy/miFtGA/Do7tPdTiJkqtZVVJaQQAfLJ
	TIXKD5S927+eubdVVewXpPgOSYFTCZf6Mldx0RsN7YwOrTJ10xidaonMJOiyTgwexw7PMcTu4oO
	eXJ6CWOXojj9tklz1KfTcp17vl1p9waMe9LPSZQd3036/T1SOnA2rTGv8+TUOiYWM1xHwAilBJQ
	Wn/cph751yyWe9C/EE2iPcq4oAOY0+bTcynZp8Sg==
X-Gm-Gg: AfdE7ckc03QwgshWcsamuOlO4T+ZnI9gY4D3I1sWJqmB3bq5UyMybl5y5simxgHR2bP
	d1t4nDDl/CxTQejpNvHgN72bRpek1bllthI8pD4hjqjCMvZ40TEK9zC0JbMQzggCZtVJOfJeTt7
	zjCDSHasAKmSJjrRmStmLWquEhT7LBv94lM2Tg9P+hxe62rF4VXVfeNFMlzaZeV1Cv9NL+
X-Received: by 2002:a05:6214:2e41:b0:8f0:ae2d:c7c7 with SMTP id 6a1803df08f44-8fc96d4e67dmr2225146d6.11.1783336415765;
        Mon, 06 Jul 2026 04:13:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2e41:b0:8f0:ae2d:c7c7 with SMTP id
 6a1803df08f44-8fc96d4e67dmr2224686d6.11.1783336415323; Mon, 06 Jul 2026
 04:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1778672403.git.sean@starlabs.systems>
In-Reply-To: <cover.1778672403.git.sean@starlabs.systems>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:13:24 +0200
X-Gm-Features: AVVi8CeFFePxuRywRmMqlwf5mHGqRwyyFqQVpM6X4lLYh8vyhVbRDqfzazGMANI
Message-ID: <CAPx+jO9t8Hr5Tcozi0Gs+sUMUuzrxQ8US3qS-+mZGXs_8WzU5g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mmc: rtsx_usb_sdmmc: qualify card-detect on tray readers
To: Sean Rhodes <sean@starlabs.systems>
Cc: Ulf Hansson <ulfh@kernel.org>, Ricky Wu <ricky_wu@realtek.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-mmc@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de,
        ulf.hansson@linaro.org, adrian.hunter@intel.com, rogerable@realtek.com,
        matthew.schwartz@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kLaeUPbggMNmJOz_9I7BniepJe5MOD23
X-Proofpoint-ORIG-GUID: kLaeUPbggMNmJOz_9I7BniepJe5MOD23
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b8de0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=lDt4X5A2n95T_cetI-kA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX765gghSlW7SN
 Rh0+7BcvbBs7+1o6W1HYcYXC3Nl4EZhV9cZSxn4kJFUvsssirk6Y4tjkSppS57gHw+XbO5Mzf4M
 jio9lWBX8bLfAQapdeG98jbr6oCMxg3ifJGRUj/yvrzBd845JKAdTV7lepJ3PW96cSTcTZLQX3v
 bmsJbLcVv+Aj2L9xEeQpAu0m5aG+LpnsLXLDkfReOt9GUEDRNCsBjcOqKbf43klw01fmb6lZz2A
 zYnK1Cmpw63swvQkz19OJmHY222LXTKxscxAK78iyNc7HmvW25EfUybKVDp+T9eQOKPnc9KdgIX
 CFfP9i6gbvYvcy90fgYBxloKOVo8eerBRwI4Xgbd4AhEO871V2htDAyzZ41uW7AmX03vV0pNMlj
 J5xwiGScPkHJXyYJ8TC41q0sd6H6V6CFKG6kPPBS3RqXnp5/27y3M7OLZpN9h3BCp08g1QP6qDq
 91CEHC3WMQYOnGu3Tsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX6fZRGHyAqWZN
 j14Vg4sGxa7nGujnu+N+5K6rY815RdNqe+Jqeny9CY45ErsHUGBy6CzOk9VMabKs3J+Jho4feg0
 tlJs7mXWhgz2wR4ApUR3lKqwZ/zF1+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113

On Wed, May 13, 2026 at 1:40=E2=80=AFPM Sean Rhodes <sean@starlabs.systems>=
 wrote:
>
> Hi Uffe, USB/cardreader folks,
>
> Uffe suggested sending this as an RFC and adding the USB/cardreader side,
> because this may need input on where the media qualification should live.
>
> I previously sent an RFC for the USB/cardreader runtime-PM side of this
> problem. That did not get USB/cardreader-side guidance on the detect
> layering question; the only substantive feedback was that the MMC child
> should already own runtime PM for a real inserted card. I have since
> retested that, and it is correct: with real media inserted,
> rtsx_usb_sdmmc holds runtime_usage=3D1 and the USB parent remains active
> through runtime_active_kids=3D1.
>
> The remaining failure is narrower: empty tray only. Raw SD_CD remains
> asserted, the MMC core repeatedly probes non-existent media, and the
> runtime-PM hierarchy does not settle.
>
> This is an RFC for the Realtek RTS5129 tray-reader false-detect issue.
>
> Short version: on these machines, raw SD_CD is not a reliable "card is
> present" signal. It is asserted when the tray is inserted, even if the tr=
ay
> contains no SD card.
>
> That means the current driver reports card-present to the MMC core for an
> empty tray. The MMC core then does what it should do: it tries to initial=
ize
> a card. The commands time out, no mmcblk device is created, but because
> SD_CD remains asserted the detect path is entered again. In practice this
> keeps rtsx_usb_sdmmc runtime-active and prevents the USB parent from
> autosuspending.
>
> I retested this on an RTS5129 reader:
>
>   - tray removed: no mmcblk device, rtsx_usb_sdmmc suspends, USB parent
>     suspends
>   - empty tray inserted: no mmcblk device, repeated CMD0/CMD8/CMD55/CMD1
>     probe loop, rtsx_usb_sdmmc remains active, USB parent remains active
>   - tray + SD card: mmcblk0 appears and reads correctly; the MMC child
>     holds runtime PM as expected
>
> The old Realtek rts5139 staging driver did not treat raw tray/CD state as
> sufficient. It qualified insertion by checking whether media actually
> responded before reporting a card present. That approach works on this
> hardware, and avoids papering over the issue in runtime PM.
>
> I know the previous version put the validation directly in ->get_cd(), an=
d
> the objection was that MMC command probing does not belong there. I'm not
> trying to ignore that feedback. The question for this RFC is the layering=
:
>
>   - if the only exposed hardware bit is "tray inserted", not "card presen=
t",
>     where should the Realtek-specific media qualification live?

It depends on what the media qualification must consist of.

>   - is an rts5139-style qualification acceptable in rtsx_usb_sdmmc if it =
is
>     kept out of the generic MMC core?

We can certainly add some specific hacks to the rtsx_usb_sdmmc for
this, but I think we should be able to do it without having to
build/send all the corresponding mmc commands directly in the driver.
In principle we should be able to rely on the mmc_rescan() work to do
this for us, in one way or the other.

A part that is still a bit unclear to me, is how we should handle the
card detect when the tray is/gets inserted. Is it possible to
insert/remove a card to the tray when the tray is already inserted -
or does the tray need to be removed (and inserted again) to allow
this?

>   - or should the USB/cardreader parent expose a qualified media-present
>     state to the SD/MMC child?

Is there a way for the USB card reader driver to figure out if there
is a "card present"?

I thought all it could do was to signal whether the tray is inserted or not=
? No?

>
> This is intentionally copied to linux-usb and the char/misc/cardreader
> maintainers, not just linux-mmc, because one possible answer is that the
> USB/cardreader parent should expose a qualified media-present state rathe=
r
> than having rtsx_usb_sdmmc compensate for raw SD_CD.
>
> Patch 2 keeps the validation path in a known initial electrical state by
> starting SD power-up at 3.3V, matching the old Realtek rts5139 driver. It=
 is
> included because the validation sequence must not inherit a previous 1.8V
> state.
>
> I have deliberately left the SDR/UHS rate patches out of this RFC. They a=
re
> separate capability work and just make this harder to review. This series=
 is
> only about making tray card-detect correct and stopping the empty-tray de=
tect
> loop.
>
> Thanks,
> Sean
>
> Sean Rhodes (2):
>   mmc: rtsx_usb_sdmmc: avoid false card-detect on tray readers
>   mmc: rtsx_usb_sdmmc: start card power-up at 3.3V
>
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 161 ++++++++++++++++++++++++++++--
>  1 file changed, 153 insertions(+), 8 deletions(-)

Kind regards
Uffe
