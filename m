Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59C246788
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070560; cv=pass; b=lsUVkV2QU+KNL0f8CZwiYoTn31SlU+LkaNtVrKnN3vuEK+CaqMxea+Px3zjrDwPI4YBchGiWQIv59dvT8H9At0OYuDht2x3mphv+wHKVLr5RCVLJMtLHxZD8ykCQ6uqERCUYLREXCNNKsrJSD8vbq9qBiwN6E94Cbh953ryFsy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070560; c=relaxed/simple;
	bh=UPqRbt0X5R740pgfqeDdxfhlNiihnRU9VUmOR2dftcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXeUF6zYT0unlcHcJFTI+FBDPzBA7BOh8gV1vn+4jegxuUBL+WHIblrwVWLyY3JmDnoyOk8EVCpLRMWNDkVACBZrftbJsK0BtM38LGC5qu/mIEiG8CsyblrzRPo6hxmpvS/FaHFKbVFzoBuuRxy4wcamVWlOq9CPHDLCGovz0zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzmG55gN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TozqnaIK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzmG55gN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TozqnaIK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2emOL4061604
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 05:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbzw20D8FYSmsWZCeDGMQXWH0ByXuhpAnnM3jTCycD8=; b=lzmG55gNfHca5ZlV
	LpIpnXLZ8vgWQSUA9wzHxBkaxiPDTf6rbWt5lgO5Nf779G/CZyhMeW1IZtSR94oJ
	RLAy2LLgTN5ZmR69Dlyx8PkrCJFACd7DPlxbPSKNGiH8988THSfZ7f993pF55XAE
	0cvTQpKAc4doU063BnOmQATuzwOet6JvVWhMIkjzuU6qVXP+iP4NAfccJ9xW+0fC
	DwqKuI/UAw8EgBD4RW3FRXZR0+uX0pxODdu9uYDGtG/kk3hsx7qaBDmK9y7w53bE
	Yn1pu71ohC4ai5nbuke4M96dFKY4zCz/lP+ArR19AJa3MPUznc0ht3MbVNhQt+TH
	1OMhmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2gvmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 05:49:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso776690685a.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 22:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781070556; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3+1+aw9eCptGurhwxV1HhVdwI0Op4MamkTGXTCTlHmsQEmKqAUNRi7fx+Cdzb/wvk
         Arw8GKnHIh4w6pQ9duvFrHcxJfUjZxlAeTF4grq3prpD0GQdRDNy9X6InHoLjhwJxx9D
         phSLjxooVXdibN/nDC2KIsYnli9VXADrdyVD2HhRS0FWkAlQf+Mw19IE4Ft3FJogSOz7
         fJBBVY4r8RKrd53NDRGt1JqghL2tDh1fO52l7MvKBPltK30oseOmiKdTvqeZWTzEGDnb
         Ei+unSYylqY9G9Ba4dAfPI4/neurfluS/BKppqCuluMHS+5LKLaGCByPgy/YkuftbV19
         xtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hbzw20D8FYSmsWZCeDGMQXWH0ByXuhpAnnM3jTCycD8=;
        fh=lHM0tFYQO+G8r673nhitv5DfwAY3iU0OrGW3LooQ6lE=;
        b=lR1B1O/H9tFnQeegDe2VwbdV1ujg5QgfEVaTV9Q/Zk+TtUVL+cXI00nMVyGxOE8EH6
         bx/FVxlBT5P4+rz2OiEUkDv7DqIVOZQtYDR4bsrolIiivDEzZvUKroAMqFtNKCAlACtt
         W1PXdZaE9KpRGNQ3O9c/pM9ovKRFDs232aO4h2Rhx1F77k46TdMM266a0GOxVPq1dhDe
         +PEYegJy5KAVudW6k6vsK6HQor5JiX/G+KRQ18qF2MnFw6pmSYBPEtMPXJj686+G+T+q
         ICQUpO8otiaxO5WvZNFAYPi7rbEueHvqDoxNbip7TqN+ZYGN7YmYjMBBH8hvGC9A2LGN
         XtjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070556; x=1781675356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbzw20D8FYSmsWZCeDGMQXWH0ByXuhpAnnM3jTCycD8=;
        b=TozqnaIKv2Q5JuKS1p+/p0VsNsu+oodHyPhrrQ/wsb3fhWlZ/48g1h0gY6LMngrzl8
         KzCrXE0Q72kPgUB8WDFp1H14LPfLo2A4061FQQG8ESHAUqAv1LJ85lwHUCYgGbwxT3bV
         85zErfb3g8SscQyei6ueow3zjqs+/ABO78hhwZT08wBDxKN2AUqwdkFNtQ4pG5jIktoF
         9OGzI5eFFPmfpwwZY4k9RrXCF8Md2ZAUFxEmTbjOxJD7exfRNIv/rvtzC9HAEP2Le3iH
         UmskTc6s8jsqVvLWDR+F282JcK2kk8h+hXM4SczeCOZV50x/bIpaGXHiEEBQMEwfV2Ja
         aR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070556; x=1781675356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hbzw20D8FYSmsWZCeDGMQXWH0ByXuhpAnnM3jTCycD8=;
        b=sCVuntHXLYiaq/0/EhFaakIZZS/t9RNYmuVuYZ1Vhi4Pi0yaQ85omwFZBR3NTA4i/u
         Qb3B19YWcAmwOrMdnXkVk+H+/nK1IuJAInp4x6KNzSV7D1nH1L54+zsIDtG9Zj3kVVEB
         hFF/f/7Hdnu2bi8nOf8tMqjTW06tmm6lAkfGBcsenvuOEMfVR/h8+1otdi7uhZImtvbd
         R36PWgbUT+b7+eDs3bRxxl2OG4gt3WXLX25Q6m8+kRS/DwhM3KFfDXTU/hwcDu9aSfUx
         px1emr+UwUKjtrBH1CNSCfLu9bkD+G5hT5bmXBN6Q0+l6Pg9VuwzGmYzCe2goZp1JJ+h
         jZ8g==
X-Forwarded-Encrypted: i=1; AFNElJ8mhCYl8hYlUA2ueReqJupbqh/3ejnRG5UJXk05vXmRjf75GpBfzRUinow+zi+i2fdUu9i/G4PZuM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyohXascIjjeKu+325cHOxaf2xaH8sm6z5pWRdUqYhkVmOf0W+R
	Z+TK1BMN+1s3STuGji2F0rDZv7R/T47yJBXJfVBMZGaJeTxmXL9UVBrmTa/z36+MaEUOKpaGiiZ
	PvYaBVUyzetI39VMSrWiWPes2o1V5p5u5UR0pjYHjsgEClOqDEAPqOFOEuXAUDYcazQD001N2He
	OkKajEHqVn2w4WLynJh+NI1omY+YfEknxY6zxg4Q==
X-Gm-Gg: Acq92OFWoVDcDIP6jurXb42k59uoqlKXNT1Tgsb3zyX57ELzaK866aR3EstdHctFWn+
	QdI5gSiT3sAfET29EL2BSjTE8gUDtnqlqz8u0IPvDuKQTYAZn9hYM9U0FGJIV9XV1QzonG8T4Zx
	Uk1Nfue+UPia17cr+bRAaogAvtHtYGMdmnwUT98HVaf5fr3PYhLt/euGIZy1upIiSxdqwb+4F7K
	JMNHiSgi90YiKqJ3nJgJH2MWwWeqT0EDXmacASH5Nfy5TqYDyR/G4VIJrk8PHgFDVN6LoQAYh/b
	S7bQ76bRrQJCdK1iqZSI0HccVm+bvZHX
X-Received: by 2002:a05:620a:1d06:b0:914:ca75:e8cb with SMTP id af79cd13be357-915a9d9649emr3729481185a.39.1781070555879;
        Tue, 09 Jun 2026 22:49:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1d06:b0:914:ca75:e8cb with SMTP id
 af79cd13be357-915a9d9649emr3729479185a.39.1781070555453; Tue, 09 Jun 2026
 22:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609193635.2284430-1-tyler.baker@oss.qualcomm.com>
In-Reply-To: <20260609193635.2284430-1-tyler.baker@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 07:49:04 +0200
X-Gm-Features: AVVi8Cf8dSXCPgyP7MqAedF6NJffKg2QK_S26zTj2cvlRjGley-OvXYegh_YNCk
Message-ID: <CAFEp6-1ksgRoWjNzDJTrvczSi=8oO_TSr7+V8KB2ZsAssJSuhg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_fs: initialize reset_work at allocation time
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Baldyga <r.baldyga@samsung.com>,
        Michal Nazarewicz <mina86@mina86.com>, Felipe Balbi <balbi@kernel.org>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a28fadc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=mLohLnV0Ck6ZQudTKkoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX0koJFZzjglGL
 d8DPe/fczIEFftkivVGYet60GuPlyeDrjB2Qf7RmO+ZV/fDjgEDVIYHUtF8sxcrdU6CvHlukoXB
 dpi1P4G9JKOxc3vVOudwcv7CG3oqlDaPGj3zueSA3EceR07PCKp6Brrv0NTnCbjZd9gnxB45SQs
 Hhl0xztcDNjhDq8Q8YP7CaDLsro8RHnL3r9zlz3SvHAe8m8eKz0zsQ8SvkHKYhU3HlklQ8qf0jJ
 YkvmD38S9LwbpBi85prNw2LmxGlbBeEvj1vOpLAkmoKEDnlPwyFLHJH9gGiFD/EDogckqGDNbGF
 tcQ163hzbJpUmCIX5q7xylzoXogFQG2UhfcmPZkquw38ExQbnyYClkvyRJMIMESjX/1PvF41luz
 kPY8mtTaYsl6pG1wAKQImIKQldwil+Hc0q+vaM2vBucYQS5NrFLSqvfg5Yoyzo598ZdCNGMwvMW
 HuZYNfnn2SRzBQGneLg==
X-Proofpoint-ORIG-GUID: NEEVEvQf7VllKUJX2gOi1DQMtqKN14iL
X-Proofpoint-GUID: NEEVEvQf7VllKUJX2gOi1DQMtqKN14iL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052

On Tue, Jun 9, 2026 at 9:36=E2=80=AFPM Tyler Baker <tyler.baker@oss.qualcom=
m.com> wrote:
>
> ffs_fs_kill_sb() unconditionally calls cancel_work_sync() on
> ffs->reset_work when a functionfs instance is unmounted:
>
>         ffs_data_reset(ffs);
>         cancel_work_sync(&ffs->reset_work);
>
> However ffs->reset_work is only ever initialized via INIT_WORK() in
> ffs_func_set_alt() and ffs_func_disable(), and only on the
> FFS_DEACTIVATED path. That state is reached solely by ffs_data_closed()
> when the instance is mounted with the "no_disconnect" option, so for the
> common case (no "no_disconnect", or mounted and unmounted without ever
> being deactivated) reset_work is never initialized.
>
> ffs_data_new() allocates the ffs_data with kzalloc_obj() and does not
> initialize reset_work, and ffs_data_reset()/ffs_data_clear() do not touch
> it either, so reset_work.func is left NULL. cancel_work_sync() on such a
> work then trips the WARN_ON(!work->func) guard in __flush_work():
>
>   WARNING: kernel/workqueue.c:4301 at __flush_work+0x330/0x360, CPU#3: um=
ount
>   Call trace:
>    __flush_work
>    cancel_work_sync
>    ffs_fs_kill_sb [usb_f_fs]
>    deactivate_locked_super
>    deactivate_super
>    cleanup_mnt
>    __cleanup_mnt
>    task_work_run
>    exit_to_user_mode_loop
>    el0_svc
>
> On older kernels cancel_work_sync() on a zero-initialized work struct was
> a silent no-op, which hid the missing initialization.
>
> Initialize reset_work once in ffs_data_new() so it is always valid for
> the lifetime of the ffs_data, and drop the now-redundant INIT_WORK()
> calls from the two deactivation paths.
>
> Fixes: 18d6b32fca38 ("usb: gadget: f_fs: add "no_disconnect" mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/usb/gadget/function/f_fs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 75912ce6ab55..1ee21e29ef73 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -288,6 +288,7 @@ static int ffs_acquire_dev(const char *dev_name, stru=
ct ffs_data *ffs_data);
>  static void ffs_release_dev(struct ffs_dev *ffs_dev);
>  static int ffs_ready(struct ffs_data *ffs);
>  static void ffs_closed(struct ffs_data *ffs);
> +static void ffs_reset_work(struct work_struct *work);
>
>  /* Misc helper functions ***********************************************=
*****/
>
> @@ -2221,6 +2222,7 @@ static struct ffs_data *ffs_data_new(const char *de=
v_name)
>         init_waitqueue_head(&ffs->ev.waitq);
>         init_waitqueue_head(&ffs->wait);
>         init_completion(&ffs->ep0req_completion);
> +       INIT_WORK(&ffs->reset_work, ffs_reset_work);
>
>         /* XXX REVISIT need to update it in some places, or do we? */
>         ffs->ev.can_stall =3D 1;
> @@ -3775,7 +3777,6 @@ static int ffs_func_set_alt(struct usb_function *f,
>         if (ffs->state =3D=3D FFS_DEACTIVATED) {
>                 ffs->state =3D FFS_CLOSING;
>                 spin_unlock_irqrestore(&ffs->eps_lock, flags);
> -               INIT_WORK(&ffs->reset_work, ffs_reset_work);
>                 schedule_work(&ffs->reset_work);
>                 return -ENODEV;
>         }
> @@ -3806,7 +3807,6 @@ static void ffs_func_disable(struct usb_function *f=
)
>         if (ffs->state =3D=3D FFS_DEACTIVATED) {
>                 ffs->state =3D FFS_CLOSING;
>                 spin_unlock_irqrestore(&ffs->eps_lock, flags);
> -               INIT_WORK(&ffs->reset_work, ffs_reset_work);
>                 schedule_work(&ffs->reset_work);
>                 return;
>         }
> --
> 2.43.0
>
